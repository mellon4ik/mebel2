<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <a class="btn btn-primary" data-toggle="tooltip" href="<?php echo $insert; ?>" data-original-title="<?php echo $button_insert; ?>"><i class="fa fa-plus"></i></a>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"/></td>
                            <td class="left"><?php echo $column_name; ?></td>
                            <td class="left"><?php echo $column_email; ?></td>
                            <td class="right"><?php echo $column_action; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if ($emails) { ?>
                            <?php foreach ($emails as $email) { ?>
                                <tr>
                                    <td style="text-align: center;">
                                        <input type="checkbox" name="selected[]" value="<?php echo $email['id']; ?>"/>
                                    </td>
                                    <td class="left"><?php echo $email['name']; ?></td>
                                    <td class="left"><?php echo $email['email']; ?></td>
                                    <td class="right"><?php foreach ($email['action'] as $action) { ?>
                                            <a class="btn btn-primary" title="" data-toggle="tooltip" href="<?php echo $action['href']; ?>" data-original-title="<?php echo $button_edit; ?>">
                                                <i class="fa fa-pencil"></i>
                                            </a>
                                        <?php } ?></td>
                                </tr>
                            <?php } ?>
                        <?php } else { ?>
                            <tr>
                                <td class="center" colspan="4"><?php echo $text_no_results; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </form>
                <div class="pagination"><?php echo $pagination; ?></div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>
