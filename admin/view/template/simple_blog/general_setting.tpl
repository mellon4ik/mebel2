<?php echo $header; ?>
    <?php echo $column_left; ?>
    
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-simple-blog" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                </div>
            
                <h1><?php echo $heading_title; ?></h1>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
        
        <div class="container-fluid">
            <?php if ($error_warning) { ?>
                <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            <?php if ($success) { ?>
                <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                </div>
            <?php } ?>
            
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
                </div>
                
                <div class="panel-body">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-simple-blog" class="form-horizontal">    

                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_simple_blog_seo_keyword; ?>"><?php echo $entry_simple_blog_seo_keyword; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="simple_blog_seo_keyword" value="<?php echo $simple_blog_seo_keyword; ?>" class="form-control" />
                            </div>
                        </div>  
                        
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_simple_blog_heading; ?>"><?php echo $entry_simple_blog_heading; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="simple_blog_footer_heading" value="<?php echo $simple_blog_footer_heading; ?>" class="form-control" />
                            </div>
                        </div>   
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_blog_module_heading; ?>"><?php echo $entry_blog_module_heading; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="simple_blog_heading" value="<?php echo $simple_blog_heading; ?>" class="form-control" />
                            </div>
                        </div>   
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_related_heading; ?>"><?php echo $entry_product_related_heading; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="simple_blog_product_related_heading" value="<?php echo $simple_blog_product_related_heading; ?>" class="form-control" />
                            </div>
                        </div>  
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_comment_related_heading; ?>"><?php echo $entry_comment_related_heading; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <input type="text" name="simple_blog_comment_related_heading" value="<?php echo $simple_blog_comment_related_heading; ?>" class="form-control" />
                            </div>
                        </div>   
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_display_category; ?>"><?php echo $entry_display_category; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($simple_blog_display_category) { ?>
    	    							<input type="radio" name="simple_blog_display_category" value="1" checked="checked" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_display_category" value="0" /> <?php echo $text_disabled; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="simple_blog_display_category" value="1" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_display_category" value="0" checked="checked" /> <?php echo $text_disabled; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div>   
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_comment_approval; ?>"><?php echo $entry_comment_approval; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($simple_blog_comment_auto_approval) { ?>
    	    							<input type="radio" name="simple_blog_comment_auto_approval" value="1" checked="checked" /> <?php echo $text_yes; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_comment_auto_approval" value="0" /> <?php echo $text_no; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="simple_blog_comment_auto_approval" value="1" /> <?php echo $text_yes; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_comment_auto_approval" value="0" checked="checked" /> <?php echo $text_no; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div>
                        
                        <!-- <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_show_author; ?>"><?php echo $entry_show_author; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($blog_show_authors) { ?>
    	    							<input type="radio" name="blog_show_authors" value="1" checked="checked" /> <?php echo $text_yes; ?>&nbsp;
    	    							<input type="radio" name="blog_show_authors" value="0" /> <?php echo $text_no; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="blog_show_authors" value="1" /> <?php echo $text_yes; ?>&nbsp;
    	    							<input type="radio" name="blog_show_authors" value="0" checked="checked" /> <?php echo $text_no; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div> -->
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_author_information; ?>"><?php echo $entry_author_information; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($simple_blog_author_information) { ?>
    	    							<input type="radio" name="simple_blog_author_information" value="1" checked="checked" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_author_information" value="0" /> <?php echo $text_disabled; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="simple_blog_author_information" value="1" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_author_information" value="0" checked="checked" /> <?php echo $text_disabled; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_related_article; ?>"><?php echo $entry_related_article; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($simple_blog_related_articles) { ?>
    	    							<input type="radio" name="simple_blog_related_articles" value="1" checked="checked" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_related_articles" value="0" /> <?php echo $text_disabled; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="simple_blog_related_articles" value="1" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_related_articles" value="0" checked="checked" /> <?php echo $text_disabled; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-2 col-md-2 col-sm-2 col-xs-12 control-label"><span data-toggle="tooltip" title="<?php echo $help_show_social_site_option; ?>"><?php echo $entry_show_social_site_option; ?></label>
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <div class="checkbox-inline">
                                    <?php if($simple_blog_share_social_site) { ?>
    	    							<input type="radio" name="simple_blog_share_social_site" value="1" checked="checked" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_share_social_site" value="0" /> <?php echo $text_disabled; ?>
    	    						<?php } else { ?>
    	    							<input type="radio" name="simple_blog_share_social_site" value="1" /> <?php echo $text_enabled; ?>&nbsp;
    	    							<input type="radio" name="simple_blog_share_social_site" value="0" checked="checked" /> <?php echo $text_disabled; ?>
    	    						<?php } ?>
                                </div>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
            
        </div>
        
    </div>

    
<?php echo $footer; ?>