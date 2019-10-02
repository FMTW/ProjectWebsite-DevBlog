<hr/>
<style>
        .msg{margin: 20px 0px;  background: #ccc;padding:5px;}
        .msg .info{overflow: hidden;}
        .msg .username{float:left; color:blue;}
        .msg .time{float: right; color:#999;}
        .msg .content{width:100%;}
</style>
<div class='container bg-light pb-2'>
    <!-- Leave message-->
    
        <form action="comment.php" method="post">
            <textarea name='content' placeholder="comment" cols='60' rows='10'></textarea>
            <br/>
            {# <div class="row py-2"> #}
            <input class='btn ml-auto btn-secondary btn-sm' type='submit' value='comment'>
            {# </div>   #}
        </form>
    <?php foreach( $rows as $row ){ ?>
        <!--view message-->
            <div class='msg'>
                <div class='info'>
                    <span class='username'><?php echo $row['user'];?></span>
                    <span class='time'><?php echo $row['created'];?></span>
                </div>       
                <div class='content'>
                    <?php echo $row['content'];?>
                </div>     
            </div>
    <?php } ?>
    
                
</div> 