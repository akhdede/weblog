<?php
class General{

    private $db;

    public function __construct($database){
        $this->db = $database;
    }

    public function tglIndo($tanggal){
        $bulan = array(
            1 => 'Jan',
            'Feb',
            'Mar',
            'Apr',
            'Mei',
            'Jun',
            'Jul',
            'Ags',
            'Sep',
            'Okt',
            'Nov',
            'Des'
        );

        $pecah = explode('-', $tanggal);

        return $pecah[2] . ' ' . $bulan[(int)$pecah[1]] . ' ' . $pecah[0];
    }

    public function page($query, $recordsPerPage){

        $startingPosition = (isset($_GET['pageNo'])) ? ($_GET['pageNo']-1)*$recordsPerPage : 0;

        $stmt = $query . ' LIMIT ' . $startingPosition . ', ' . $recordsPerPage;

        return $stmt;
    }

    public function pageLink($query, $recordsPerPage){

        $self = $_SERVER['PHP_SELF'];

        $stmt = $this->db->prepare($query);
        $stmt->execute();

        $totalNoOfRecords = $stmt->rowCount();

        if($totalNoOfRecords > 0){
            echo '<div class="col-md-12">';
            echo '<ul class="pagination">';

            $totalNoOfPages = ceil($totalNoOfRecords/$recordsPerPage);

            $currentPage = 1;

            if(isset($_GET['pageNo'])){
                $currentPage = $_GET['pageNo'];
            }

            if($currentPage != 1){
                $previous = $currentPage-1;

                echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=1>First</a></li>';
                echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=' . $previous . '>Previous</a></li>';
            }

            for($i = 1; $i <= $totalNoOfPages; $i++){
                if($i == $currentPage){
                    echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=' . $i . ' style="color: red">' . $i . '</a></li>';
                }
                else{
                    echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=' .$i . '>' . $i . '</a></li>';
                }
            }

            if($currentPage != $totalNoOfPages){
                $next = $currentPage+1;

                echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=' . $next . '>Next</a></li>';
                echo '<li class="page-item"><a class="page-link" href=' . $self . '?pageNo=' . $totalNoOfPages . '>Last</a></li>';
            }

            echo '</ul>';
            echo '</div>';
        }
    } 
}
?>
