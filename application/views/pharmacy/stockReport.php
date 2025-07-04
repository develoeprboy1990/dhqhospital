<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/buttons.dataTables.min.css">
    <section class="content-header">
      <h1 class="text-success">
        Search Records
        <!-- <small>Control panel</small> -->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Search Records</li>
      </ol>
    </section>

    <section class="content" style="margin-top: 5px;">
    <div class="box box-primary">
    <div class="box-body" style="width: 100%;">
    <div class="col-md-12" style="margin-top: 5px;">
    <div class="row">
    <div class="panel-body">
    <form method="post" action="<?php echo base_url('PharmacyReport/StockReport') ?>">

    	  <div class="col-md-2">
            <label for="">Select Category</label>
            <select name="category" id="category" style="width: 100%" class="select2">
             <option value="">All</option>
              <?php foreach ($getCats as $row): ?>
                  <option value="<?php echo $row->name ?>"><?php echo $row->name ?></option>
              <?php endforeach; ?>
           </select>
        </div>

        <div class="col-md-3">
            <label>Medicine Name</label>
            <select name="item" class="select2 item" id="item"  style="width:100%">
          <option value="">Select Medicine</option>
            <?php foreach ($items as $value) {
             
             ?>
          <option value="<?php echo $value->id ?>" class="item_list"><?php echo $value->name; ?></option>
        <?php } ?>
         </select>
        </div>


        <div class="col-md-2" style="margin-top: 15px;">
        <div align="center">
            <input type="submit" name="search" id="search" value="Search" class="btn btn-success"  />
        </div>
        </div>
        
    </form>

    </div>
    </div>
    </div>
    </div>
    </div>
    </section>



    <section class="content" style="margin-top: 5px;">
    <div class="box box-primary">
    <div class="box-body" style="width: 100%;">
    <div class="col-md-12" style="margin-top: 5px;">
    	
    <div class="row">
    <div class="panel-body">
    <div class="table table-striped table-bordered table-responsive" style="width: 100%; background-color: #e4e0e040; margin-top: 10px;">
    	<table id="example1" class="table table-hover table-bordered">
		<thead>
			<tr>
            <th>S.No</th>
			<th>Item Name</th>
			<th>Total Quantity</th>
            <th>Indent Quantity</th>
            <th>Remaining Quantity</th>
			</tr>
		</thead>

		<tbody>
			<?php 
            $open_total=0;
            $purchase_total=0;
            $sale_total=0;
            $category='';
            $count=0; foreach($record->result() as $row){$count++;
                $sale=$row->p_qty+$row->uind_qty;
                $remaining=$row->quantity+$row->sup_qty+$row->adj_qty;
                if($category!=$row->category)
                {
                    $category=$row->category;
                    ?>
                     <tr style="background-color: #BBC4D9;color: white;font-weight: bold;font-size: 18px">
                 <td><?php echo $category; ?></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
             </tr>

                <?php }
             ?>
            
			<tr>
				<th><?php echo $count; ?></th>
                <th><?php echo $row->name ?></th>
				<td><?php echo $remaining ?></td>
                <td><?php echo $sale ?></td>
				<td><?php echo $remaining-$sale ?></td>
                			 
			</tr>
        <?php  $open_total=$open_total+$remaining;
                $purchase_total=$purchase_total+$sale;
                $sale_total=$sale_total+$remaining-$sale;
             } ?>
        <tr style="font-size: 20px;color: blue;background-color: lightgray">
            <td></td>
            <td></td>
            <td><?php echo $open_total ?></td>
            <td><?php echo $purchase_total ?></td>
            <td><?php echo $sale_total ?></td>
        </tr>
		</tbody>
		</table>
	</div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </section>
   
	<!-- Datatables CDN START -->
    <!-- <script src="<?php //echo base_url();?>assets/js/jquery-3.3.1.js"></script> -->
    <script src="<?php echo base_url();?>assets/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/dataTables.select.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.flash.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/jszip.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/pdfmake.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/vfs_fonts.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.html5.min.js"></script>
    </script>

    <script type="text/javascript">
     //    $(function () {
	    // $('#example1').DataTable({
	    //   'paging'      : true,
	    //   'lengthChange': true,
	    //   'searching'   : true,
	    //   'ordering'    : true,
	    //   'info'        : true,
	    //   'autoWidth'   : false,
	    //   'stateSave'   : true
	    // })
	    // });

	    $(document).ready(function() {
        var dept = $("#search_dept_report option:selected").text();
            if(dept!="Select Department"){
                 dept = $("#search_dept_report option:selected").text();
            } else {
                dept = "";
            }
            var sub_dept = $("#sub_dept_id option:selected").text();
            if(sub_dept!="Select Department"){
                 sub_dept = $("#search_dept_report option:selected").text();
            } else {
                sub_dept = "";
            }
            var headerTitle = "<h2>DHQ HOSPITAL BATKHELA<small> ("+dept+" { "+sub_dept+" } )</small></h2>";

          
            $('#example1').DataTable( {
            paging:   false,
            ordering: false,
            info:     false,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'pdf',
                    text: 'PDF'
                },
                {
                    extend: 'copy',
                    text: 'Copy'
                },
                {
                    extend: 'csv',
                    text: 'CSV'
                },
                {
                    extend: 'excel',
                    text: 'Excel'
                },
                {
                    extend: 'print',
                    text: 'Print all',
                    title: headerTitle,
                    exportOptions: {
                        modifier: {
                            selected: null
                        }
                    }
                },
                {
                    extend: 'print',
                    text: 'Print selected'
                },
            ],
            select: true
        } );

       
    } );
    </script>
    <script>
        $(document).ready(function(){
         $('#category').on('change',function(){
               var category=$('#category').val();
                 $.ajax({
                               url:"<?php echo base_url('Product/fetch_product_by_category') ?>",
                               method:"POST",
                               dataType:'json',
                               data:{category:category},
                               success:function(data)
                               {
                                        $('#item').html('');
                                    $('#item').append('<option value="">All</option>');    
                                  $.each(data,function(index,item){
                                     $('#item').append('<option value="'+ item.id+'">'+ item.name +'</option>');
                                 });  

                               }

                         });
         })
        })
    </script>