<?php
class Index{

    private $db;

    public function __construct($database){
        $this->db = $database;
    }

    public function getPosts($page){

        $query = $this->db->prepare($page);

        try{
            $query->execute();
            $posts = $query->fetchAll();
            return $posts;
        }
        catch(PDOException $e){
            die($e->getMessage());
        }
    }

    public function getAuthors($id){
        $query = $this->db->prepare("SELECT `nama_lengkap` FROM `users` WHERE `id` = ?");
        $query->bindValue(1, $id);

        try{
            $query->execute();
            $author = $query->fetch(PDO::FETCH_OBJ);

            return $author->nama_lengkap;

        }
        catch(PDOException $e){
            die($e->getMessage());
        }
    }
}
?>
