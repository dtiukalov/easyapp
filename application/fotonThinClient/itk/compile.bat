@rem = '
@echo off 
if "%MSDEV_HOME%"=="" goto nomsdev
if not exist "%MSDEV_HOME%\bin\vcvars32.bat" goto nomsdev
if "%VSINSTALLDIR%"=="" call "%MSDEV_HOME%\bin\vcvars32.bat"
%TC_ROOT%\bin\perl %0.bat %*
goto :EOF
:nomsdev
echo MSDEV_HOME is either not defined or not defined to the correct location.
echo It must be defined to point to the root of the Visual Studio compiler
echo installation.  For example:
echo set MSDEV_HOME=c:\Program Files\Microsoft Visual Studio .NET 2005\VC
goto :EOF
rem ';

################################################################################
# 
################################################################################
# REQUIRES the following be set:
#
# The root of the Microsoft Visual C++ directory must be set in the MSEDV_HOME
# environment variable.
#
# Example : set MSDEV_HOME=c:\Program Files\Microsoft Visual Studio .NET 2005\VC
#
################################################################################

sub Tell_Help
{
  print <<EOF

  Usage: compile [-h] [-debug] -DIPLIB=(${IPLIB_KEYS}) filenames

     -h     : This usage.
     -debug : To generate debugging information into the object file. 
     -DIPLIB=xxx : to specify the target library, or 'none' for ITK programs.

  Please notice:
  * Set USER_INCLUDE to augment the path for additional include files.
  * The following environment variables should be set properly:
     TC_INCLUDE   IMAN's include files.
EOF
}

# Legal values for IPLIB, with comments

%IPLIB=(
    none            => "ITK program object file",
    libuser_exits   => "user_exits library object file",
    libserver_exits => "server_exits library object file",
);

$IPLIB_KEYS=join("|",keys %IPLIB);
$IPLIB_SUMMARY=
    join("\n",
        map {
                sprintf("%35s : %s", $IPLIB{$_}, "-DIPLIB=$_")
            } 
            keys %IPLIB
        );

################################
# Checking at least two argument (-DIPLIB and source file)
################################

if ( @ARGV < 2 || $ARGV[0] =~ m~^[-/]h~ ) {
  &Tell_Help;
  exit 1;
}

$debug_mode=0;
$libtarget='';
foreach( @ARGV ) {
  if ( /^-debug/) {
    die "-debug already specified\n" if $debug_mode;
    $debug_mode=1;
  }
  elsif ( /^-DIPLIB=(${IPLIB_KEYS})$/ ) {
    die "-DIPLIB=$libtarget already specified\n" if $libtarget;
    $libtarget=$1;
  }
  elsif ( ! -f $_ ) {
      warn "\tError: $_ does not exist\n";
      $COMPILED_FAILED=1;
  }
  else {
      push @FILES, $_;
  }
}

unless ($libtarget) {
    die <<EOF
$0: No legal -DIPLIB= value. Must use one of
$IPLIB_SUMMARY
EOF
}

###############################################
# Check stated requirements, set basic includes
###############################################

if (! -d $ENV{TC_INCLUDE}) {
  print "\nThe TC_INCLUDE environment variable is either\n";
  print "not set or does not specify a valid NT directory.\n";
  exit 1;
}

# If USER_INCLUDE is undefined, default to the current directory.
if (! $ENV{USER_INCLUDE}) {
  $ENV{USER_INCLUDE} = ".";
}

# Set all include directories.
$INCLUDES = "-I$ENV{USER_INCLUDE} " .
            "-I\"$ENV{TC_INCLUDE}\" " .
            "-I\"$ENV{TC_INCLUDE}_cpp\" " .
            "-I\"$ENV{MSDEV_HOME}\\include\"";

####################################
# Only 32-bit Intel for now.
####################################
if ($ENV{PROCESSOR_ARCHITECTURE} eq "x86") {
  $DEFINES = join(" ",qw{
       -DNT40
       -DPOMDLL
       -DCRTAPI1=_cdecl
       -DCRTAPI2=cdecl
       -D_WIN32
       -DWIN32
       -DWIN32_LEAN_AND_MEAN
       -DWNT
       -DBYPASS_FLEX
       -D_INTEL=1
  }, "-DIPLIB=${libtarget}");
}
else {
    die "$0: Unrecognised architecture $ENV{PROCESSOR_ARCHITECTURE}\n";
}

# -MD specifies MSVCRT.DLL. (Previously -MT for LIBCMT.LIB, apparently)
# -GX has been replaced with -EHSc.

if ($debug_mode == 1) {
  $MISCFLAGS="-c -nologo -EHsc -W1 -Od -Z7 -MD";
}
else
{
  $MISCFLAGS="-c -nologo -EHsc -W1 -Ox -Oy- -MD";
}

$CFLAGS="$DEFINES $INCLUDES $MISCFLAGS";

$COMPILER="cl";

foreach $file (@FILES) {
  $compilecmd="$COMPILER $CFLAGS $file";
  print "$compilecmd\n";
  $compiler_status=system($compilecmd);
  print "Compiler Status: $compiler_status\n";
  $COMPILER_FAILED||=$compiler_status;
} 

exit $COMPILED_FAILED;
