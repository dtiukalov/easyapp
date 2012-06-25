package gctc.common;

import java.io.IOException;
import java.io.Reader;

public class ConcatReader extends Reader {

	private final Reader[] readers;

	private int cur;

	public ConcatReader(Reader... readers) {
		this.readers = readers;
		this.cur = 0;
	}

	@Override
	public void close() throws IOException {
		for (Reader r : readers)
			r.close();
	}

	@Override
	public int read(char[] cbuf, int off, int len) throws IOException {
		while (cur < readers.length) {
			int count = readers[cur].read(cbuf, off, len);
			if (count >= 0)
				return count;
			assert count == -1;
			cur++;
		}
		return -1;
	}

}
