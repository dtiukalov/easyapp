<?php
require_once("report.php");
class Inventory_summary extends Report
{
	function __construct()
	{
		parent::__construct();
	}

	public function getDataColumns()
	{
		return array($this->lang->line('reports_item_name'), 
					 $this->lang->line('reports_item_number'),
		 		     $this->lang->line('reports_description'), 
		 			 $this->lang->line('reports_count'), 
					 $this->lang->line('reports_reorder_level'),
					 $this->lang->line('reports_reorder_cost'),
					 $this->lang->line('reports_reorder_amount'));
	}

	public function getData(array $inputs)
	{
		$this->db->select('name, item_number, quantity, reorder_level, description,cost_price');
		$this->db->from('items');
		$this->db->where('deleted', 0);
		$this->db->order_by('name');

		return $this->db->get()->result_array();

	}
	public function getSumNumber(array $inputs){
		$this->db->select('SUM(quantity) as sum_quantity');
		$this->db->from('items');
		$this->db->where('deleted', 0);
		return $this->db->get()->row()->sum_quantity;
	}
	public function getSumPirce(array $inputs){
		$this->db->select('sum(cost_price*quantity)  as sum_price');
		$this->db->from('items');
		$this->db->where('deleted', 0);
		return $this->db->get()->row()->sum_price;
	}
	
	public function getSuppliersColumns()
	{
		return array($this->lang->line('reports_suppliers'), 
					 $this->lang->line('reports_quantity'), 
					 $this->lang->line('reports_price'));
	}
	
	public function getSuppliers(array $inputs){
		$this->db->select('sum(quantity) as quantity,sum(cost_price*quantity) as price,
		(select company_name  from ospos_suppliers as supplier where supplier.person_id=supplier_id) as supplier');
		$this->db->from('items');
		$this->db->where('deleted', 0);
		$this->db->group_by('supplier_id');
		return $this->db->get()->result_array();
	}

	public function getSummaryData(array $inputs)
	{
		return array();
	}
}
?>