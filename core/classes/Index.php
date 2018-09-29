<?php
class Index{

    protected $db;

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

class Post extends Index{

    public function getPostDetails($id){
        $query = $this->db->prepare("SELECT * FROM `posts` WHERE `id` = ? ");
        $query->bindValue(1, $id);

        try{
            $query->execute();
            $post = $query->fetchAll();

            return $post;
        }
        catch(PDOException $e){
            die($e->getMessage());
        }
    }

    public function getPostTitle($id){
        $query = $this->db->prepare("SELECT `judul` FROM `posts` WHERE `id` = ?");
        $query->bindValue(1, $id);

        try{
            $query->execute();
            $postTitle = $query->fetch(PDO::FETCH_OBJ);

            return $postTitle->judul;
        }
        catch(PDOException $e){
            die($e->getMessage());
        }
    }

    public function recentPost(){
        $query = $this->db->prepare("SELECT `judul`, `link` FROM `posts` ORDER BY `tanggal_posting` DESC LIMIT 0, 5");

        try{
            $query->execute();
            $result = $query->fetchAll();

            return $result;
        }
        catch(PDOException $e){
            die($e->getMessage());
        }
    }
}
?>
