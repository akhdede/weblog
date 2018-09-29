<?php
class General{

    private $db;

    public function __construct($database){
        $this->db = $database;
    }

    public function url(){
        return 'http://localhost/weblog';
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

    public function includeHeader(){
        include 'layouts/header.php';
    }

    public function includeFooter(){
        include 'layouts/footer.php';
    }

    public function breadcrumb($sub1=null, $query=null){

        if($sub1 != null && $query != null){
            $sub2 = $this->db->prepare($query);
            $sub2->execute();
            $sub2 = $sub2->fetch(PDO::FETCH_OBJ);
            $judul = $sub2->judul;
            echo '
            <div class="col-md-12" style="margin-left: 0; padding-left: 0">
                <nav aria-label="breadcrumb" >
                  <ol class="breadcrumb" style="background: #fff; margin-top: 20px;">
                    <li class="breadcrumb-item"><a href=" ' . $this->url() . ' ">Home</a></li>
                    <li class="breadcrumb-item"><a href=" ' . $sub1 . '.php ">' . ucfirst($sub1) . '</a></li>
                    <li class="breadcrumb-item active" aria-current="page">' . $judul . '</li>
                  </ol>
                </nav>
            </div>
            ';
        }

        if($sub1 != null && $query == null){
            echo '
            <div class="col-md-12" style="margin-left: 0; padding-left: 0">
                <nav aria-label="breadcrumb" >
                  <ol class="breadcrumb" style="background: #fff; margin-top: 20px;">
                    <li class="breadcrumb-item"><a href=" ' . $this->url() . ' ">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">' . ucfirst($sub1) . '</li>
                  </ol>
                </nav>
            </div>
            ';

        }

    }

}
?>
