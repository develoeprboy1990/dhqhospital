<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="<?php echo base_url();?>assets/css/buttons.dataTables.min.css">
<style type="text/css">
.content {
    min-height: 120px !important;
    padding: 0px!important;
    font-size: 9px !important;
}
table.table tbody tr:nth-child(even):hover td{
    background-color: #3c8dbc !important;
}

table.table tbody tr:nth-child(odd):hover td {
    background-color: #3c8dbc !important;
}
</style>
    <section class="content-header">
      <h1 class="text-success">
        Date Wise Record
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

<?php 
$from = $to =  '';

if($this->input->post('from')!='')
$from = $this->input->post('from');
else
$from = date('m/d/Y');

if($this->input->post('to')!='')
$to = $this->input->post('to');
else
$to = date('m/d/Y');  
?>

    <form method="post" action="<?php echo base_url('LAB_Report/waqar45404') ?>">

        <div class="col-md-3">
            <label>From Date</label>
            <div class="input-group date" data-provide="datepicker">
                <input type="text" class="form-control" name="from" id="from" value="<?php echo $from; ?>">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <label>To Date</label>
            <div class="input-group date" data-provide="datepicker">
                <input type="text" class="form-control" name="to" id="to" value="<?php echo $to; ?>">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-th"></span>
                </div>
            </div>
        </div>
        
        <div class="col-md-12" style="margin-top: 15px;">
        <div align="center">
            <input type="submit" name="search" id="search" value="Advance Search" class="btn btn-success"  />
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
     <?php 
        $get_logo = $this->db->SELECT('*')->FROM('hospital_info')->get()->result_array(); 
        $logo = $get_logo[0]['logo'];
         $name = $get_logo[0]['name'];       
        $img = file_get_contents($logo);  
        $data = base64_encode($img);
     ?>   
        <div id="logo_data" style="display: none;"><?php echo "data:image/png;base64,".$data; ?></div>
        <div id="logo_text" style="display: none;"><?php echo $get_logo[0]['name']; ?></div>   
    <div class="row">
    <div class="panel-body">
    <div class="table table-striped table-bordered table-responsive" style="width: 100%; background-color: #e4e0e040; margin-top: 10px;">
        <table id="example1" class="table table-hover table-bordered" style="width: 100%;">
        <thead>
              <tr style="background-color: #3c8dbc; color: #FFFFFF; font-weight: bold; text-align: left;">
                <td width="20%;">Date</td>
                <td width="20%;">Morning</td>
                <td width="20%;">Evening</td>
                <td width="20%;">Night</td>
                <td width="20%;">Total</td>
            
            </tr>

        </thead>

        <tbody>
            <?php 
            $monthYear = $monthN = $monthYear2 = $monthN2 = $paidTotal = "";
            $startTime =strtotime($from);
            $endTime = strtotime($to);
             $totalPrice = $AMorTotal = $totalDivide  = $afterAmount = 0;
for ( $i = $startTime; $i <= $endTime; $i = $i + 86400 ) {
    $thisDate = date( 'Y-m-d', $i ); 

    $thisDate_from=date_create($thisDate);
    date_add($thisDate_from,date_interval_create_from_date_string("+8 HOUR"));
    $thisDate_from =  date_format($thisDate_from,"Y-m-d H:i:s");

    $thisDate_to=date_create($thisDate);
    date_add($thisDate_to,date_interval_create_from_date_string("+32 HOUR"));
    $thisDate_to = date_format($thisDate_to,"Y-m-d H:i:s");

    $string = "id!='' AND is_deleted=0  AND date >= '$thisDate_from' and date <'$thisDate_to' AND yearly_no='22' AND type = 'Paid'";

  $sql = "SELECT SUM(price) AS TotalPrice,
        (SELECT SUM(price) FROM lab_entry WHERE $string AND shift='Morning') as M_P_A,
        (SELECT SUM(price) FROM lab_entry WHERE $string AND shift='Evening') as E_P_A,
        (SELECT SUM(price) FROM lab_entry WHERE $string AND shift='Night') as N_P_A

        FROM lab_entry WHERE `id`!='' AND is_deleted=0 AND date >= '$thisDate_from' and date <'$thisDate_to'";
     
     $query=$this->db->query($sql);
     $result_array = $query->row();
     if ( $result_array->TotalPrice >0) {
       $monthName = explode('-', $thisDate);
       if ($monthYear!=$monthName[0].'-'.$monthName[1]) {
           $monthYear = $monthName[0].'-'.$monthName[1];
       ?>
  <tr style="text-align: left; background-color: #3c8dbc; font-weight: bold; font-family: monospace; color: #FFFFFF;">
      <td>
        <?php 
        $monthN = explode('-', $monthYear);
        echo date("F", mktime(0, 0, 0, $monthN[1], 10)); 
        ?>
    </td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
  </tr>
<?php } ?>
            <?php 
                $timestamp = strtotime($thisDate);
                $day = date('l', $timestamp);


          $MPA = $result_array->M_P_A;
          if($thisDate>'2022-05-31' && $thisDate < '2022-06-11'){
          if($MPA<3000){
            $MPAA = $MPA; 
          } else if($MPA>3000 && $MPA<5000){
            $MPAA = $MPA-500; 
          } else if ($MPA>5000 && $MPA<7500){
            $MPAA = $MPA-1000; 
          } else if ($MPA>7500 && $MPA<10000){
            $MPAA = $MPA-1500; 
          } else if ($MPA>10000 && $MPA<15000){
            $MPAA = $MPA-2500; 
          } else if ($MPA>15000 && $MPA<17500){
            $MPAA = $MPA-2500; 
          } else if ($MPA>17500 && $MPA<20000){
            $MPAA = $MPA-3000;
          } else if ($MPA>20000 && $MPA<25000){
            $MPAA = $MPA-3500; 
          } else if ($MPA>25000 && $MPA<30000){
            $MPAA = $MPA-4000; 
          } else if ($MPA>30000 && $MPA<35000){
            $MPAA = $MPA-4500; 
          } else if ($MPA>35000 && $MPA<40000){
            $MPAA = $MPA-5000; 
          } else if ($MPA>40000 && $MPA<45000){
            $MPAA = $MPA-5500; 
          } else if ($MPA>45000 && $MPA<50000){
            $MPAA = $MPA-6000; 
          } else if ($MPA>50000 && $MPA<55000){
            $MPAA = $MPA-6500; 
          } else if ($MPA>55000 && $MPA<60000){
            $MPAA = $MPA-7000; 
          } else if ($MPA>60000 && $MPA<65000){
            $MPAA = $MPA-7500; 
          } else if ($MPA>65000 && $MPA<70000){
            $MPAA = $MPA-8000; 
          } 
      } else {
        $MPAA = $MPA;
      }
          $MorningString = $price = $afterDis = "";
          if($day=="Sunday"){
            $paidTotal=(int)$MPA + (int)$result_array->E_P_A + (int)$result_array->N_P_A;
            $MorningString = (int)$MPA;
            $Price = (int)$MPA;
            $afterDis = 0;
            $amount = 0;
            $divide = 0;
          } else {
           $paidTotal=(int)$MPAA + (int)$result_array->E_P_A + (int)$result_array->N_P_A;
           $amount = $result_array->M_P_A-$MPAA;
           $divide = ($amount/2);
           $MorningString = $MPA.' - '.$MPAA.' = '.$amount.' ( '.$divide.' / '.$divide.' )';
           $price = (int)$MPA;
           $afterDis = (int)$MPAA;
          }
        

              $totalPrice += (int)$price;
              $AMorTotal +=  $afterDis;
               $afterAmount += $amount;
               $totalDivide += $divide;
            ?>
            <tr <?php if($day=='Sunday'){ ?> style="font-weight: bold; text-align: left; background: green; color: #FFFFFF;" <?php } else { ?> style="font-weight: bold; text-align: left;" <?php } ?>>
                <td width="20%;"><?php echo $thisDate; if($day=='Sunday'){ echo ' ( '.$day.' )'; } ?></td>
                <td width="20%;"><?php echo $MorningString; ?></td>
                <td width="20%;"><?php echo $result_array->E_P_A; ?></td>
                <td width="20%;"><?php echo $result_array->N_P_A; ?></td>
                <td width="20%;"><?php echo $paidTotal; ?></td> 
            </tr>
            <?php  } } ?>
          
        </tbody>
        <tfoot>
            <tr style="text-align: left; background-color: green; color: #FFFFFF;">
                <td width="20%;">Total</td>
                <td width="20%;"><?php echo $totalPrice.' - '.$AMorTotal.' = '.$afterAmount.' ('.$totalDivide.' / '. $totalDivide.' )'; ?></td>
                <td width="20%;">0</td>
                <td width="20%;">0</td>
                <td width="20%;">0</td>            
            </tr>
        </tfoot>
        </table>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </section>
   
    <!-- Datatables CDN START -->
    <script src="<?php echo base_url();?>assets/js/jquery-3.3.1.js"></script>
    <script src="<?php echo base_url();?>assets/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/dataTables.select.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.flash.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/jszip.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/pdfmake.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/vfs_fonts.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.html5.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/dataTables.fixedHeader.min.js"></script>
    <script src="<?php echo base_url();?>assets/js/buttons.colVis.min.js"></script>

    </script>

    <script type="text/javascript">
     

        $(document).ready(function() {

    
            var from_date;
            var to_date;

            if( $("#from").val()!="" ) {
                  from_date = '<?php echo 'From Date : '. $from; ?>';   
            } else {
                 from_date = '';
            }

            if( $("#to").val()!="" ) {
                  to_date = '<?php echo 'To Date '.' '.' '.' '.' '.' '.': '. $to; ?>';   
            } else {
                 to_date = '';
            }  



  function DisplayCurrentTime() {
        var date = new Date();
        var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
        var am_pm = date.getHours() >= 12 ? "PM" : "AM";
        hours = hours < 10 ? "0" + hours : hours;
        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
        var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
        time = hours + "-" + minutes + "-" + seconds + " " + am_pm;
        return time;
    };
        var date = new Date();
        var month = new Array();
        month[0] = "Jan";  
        month[1] = "Feb";  
        month[2] = "Mar";  
        month[3] = "Apr";  
        month[4] = "May";  
        month[5] = "June";  
        month[6] = "July";  
        month[7] = "Aug";  
        month[8] = "Sep";  
        month[9] = "Oct";  
        month[10] = "Nov";  
        month[11] = "Dec";
        var file_name = date.getDate()+'-'+month[date.getMonth()]+'-'+date.getFullYear()+' '+DisplayCurrentTime();


        $('#example1').DataTable( {
        paging:   false,
        ordering: false,
        info:     false,
        dom: 'Bfrtip',
        fixedHeader: true,
        buttons: [
           {
                    text: 'PDF',
                    extend:'pdfHtml5',
                    title:$("#logo_text").text(),
                    filename : file_name,
                    footer: true,
                    exportOptions: {
                    },

                    customize: function ( doc ) {
                     doc.content.splice(0,1); 
                     doc.defaultStyle.alignment = 'left';
                     doc.styles.tableHeader.fontSize = 6;
                     doc.defaultStyle.fontSize = 6;
                                                         
                    doc.pageMargins = [5,80,5,12]

                    doc['header']=(function() {
                            return {
                                columns: [
                                    {
                                        image: $("#logo_data").text(),
                                        width: 70,
                                        margin:[0,-5,0,0],
                                    },
                                    {
                                        alignment: 'left',
                                        italics: true,
                                        text: $("#logo_text").text(),
                                        fontSize: 22,
                                        width:280,
                                        margin: [5,0,-20,0]
                                    },
                                    {
                                        alignment: 'left',
                                         bold: true,
                                        text: from_date + '\n' + to_date + '\n Print Date '+' : ' + file_name,
                                        fontSize: 10,
                                        width:300,
                                        margin: [-80,0,3,0]
                                    }
                                ],
                                margin: 10
                            }
                        });
                        var objLayout = {};
                        objLayout['hLineWidth'] = function(i) { return .5; };
                        objLayout['vLineWidth'] = function(i) { return .5; };
                        objLayout['hLineColor'] = function(i) { return '#aaa'; };
                        objLayout['vLineColor'] = function(i) { return '#aaa'; };
                        objLayout['paddingLeft'] = function(i) { return 5; };
                        objLayout['paddingRight'] = function(i) { return 5; };
                        doc.content[0].layout = objLayout;
                            doc.content[0].table.widths = [
                                        '20%',
                                        '20%',
                                        '20%',
                                        '20%',
                                        '20%'
                                        ]  
                }
            },
                {
                    extend: 'copy',
                    text: 'Copy',
                    filename : file_name,
                    footer: true,
                    exportOptions: {
                        
                    },
                },
                {
                    extend: 'csv',
                    text: 'CSV',
                    filename : file_name,
                    footer: true,
                    exportOptions: {
                        
                    },
                },
                {
                    extend: 'excel',
                    text: 'Excel',
                    filename : file_name,
                    footer: true,
                    exportOptions: {
                        
                    }
                },
            {
                extend: 'print',
                text: 'Print all',
                footer: true,
                 title: $("#logo_text").text(),
                 messageTop: '<p style="font-size:13px;margin-left:150px;margin-top:-10px;">' +from_date +'</p><p style="font-size:13px;margin-left:150px;margin-top:-10px;">' +to_date+'</p><p style="font-size:13px;margin-left:150px;margin-top:-10px;">Print Date : ' +file_name,
                exportOptions: {
                    
                    modifier: {
                        selected: null,
                       },

                },
           customize: function (win) {
                    $(win.document.body).find('th').addClass('display').css('text-align', 'left');
                    $(win.document.body).find('table').addClass('display').css({'font-size':'9px','font-weight':'bold'});
                    $(win.document.body).find('table').css({"position": "absolute", "top": "14%","left":"0"});
                    $(win.document.body).find('tr:nth-child(odd) td').each(function (index) {
                        $(this).css('background-color', '#D0D0D0');
                    });
                    $(win.document.body).find('h1').css('margin-left','150px');
                    $(win.document.body).prepend(
                        '<img src="<?php echo $logo;?>"  width=125 style="position:absolute; top:0; left:0;" />'
                        );
                   
                        }
            },
            {
                extend: 'print',
                text: 'Print selected',
                footer: true,
                 title: $("#logo_text").text(),
                 messageTop: '<p style="font-size:13px;margin-left:150px;margin-top:-10px;">' +from_date +'</p><p style="font-size:13px;margin-left:150px;margin-top:-10px;">' +to_date+'</p><p style="font-size:13px;margin-left:150px;margin-top:-10px;">Print Date : ' +file_name,
                 exportOptions: {
                    
                    
                    },
                      customize: function (win) {
                    $(win.document.body).find('th').addClass('display').css('text-align', 'left');
                    $(win.document.body).find('table').addClass('display').css({'font-size':'9px','font-weight':'bold'});
                    $(win.document.body).find('table').css({"position": "absolute", "top": "14%","left":"0"});
                    $(win.document.body).find('tr:nth-child(odd) td').each(function (index) {
                        $(this).css('background-color', '#D0D0D0');
                    });
                    $(win.document.body).find('h1').css('margin-left','150px');
                    $(win.document.body).prepend(
                        '<img src="<?php echo $logo;?>"  width=125 style="position:absolute; top:0; left:0;" />'
                        );
                   
                        }
        },
            {
              extend: 'colvis',
              text: 'Hide/Show Columns',
              footer: true,
          }
            ],
            scrollY:        "500px",
                scrollX:        true,
                scrollCollapse: true,
                paging:         false,
                fixedColumns:   {
                    heightMatch: 'none'
                },
            select: true,
            
            "footerCallback": function ( tfoot, row, data, start, end, display ) {
            var api = this.api(), data;

     

            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            

            pageTotal2 = api
                .column( 2, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            $( api.column( 2 ).footer() ).html(
              pageTotal2 
              );


            pageTotal3 = api
                .column( 3, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            // Update footer
            $( api.column( 3 ).footer() ).html(
                pageTotal3
            );

            pageTotal4 = api
                .column( 4, { page: 'current'} )
                .data()
                .reduce( function (a, b) {
                    return intVal(a) + intVal(b);
                }, 0 );
            $( api.column( 4 ).footer() ).html(
              pageTotal4 
              );

            
        }
      });

       
    } );
    </script>