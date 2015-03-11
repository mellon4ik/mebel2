<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-filters').submit() : false;"><i class="fa fa-trash-o"></i>
                    </button>
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
                    <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
                </div>
                <div class="panel-body">
                    <form action="<?php echo $delete; ?>" method="POST" enctype="multipart/form-data" id="form-filters">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <td style="width: 1px" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);"/></td>
                                    <td class="text-left"><?php echo $column_name; ?></td>
                                    <td class="text-left"><?php echo $column_type; ?></td>
                                    <td class="text-left"><?php echo $column_style; ?></td>
                                    <td class="text-left"><?php echo $column_coolfilter_groups; ?></td>
                                    <td class="text-right"><?php echo $column_sort_order; ?></td>
                                    <td class="text-right"><?php echo $column_status; ?></td>
                                    <td class="text-right"><?php echo $column_action; ?></td>
                                </tr>
                                </thead>
                                <tbody>
                                <?php if ($options) { ?>
                                    <?php foreach ($options as $option) { ?>
                                        <tr>
                                            <td class="text-center"><input type="checkbox" name="selected[]" value="<?php echo $option['option_id']; ?>"/></td>
                                            <td class="text-left">
                                                <span class="name"><?php echo $option['name']; ?></span>
                                            </td>
                                            <td class="text-left">
                                                <span class="name"><?php echo $option['type']; ?></span>
                                            </td>
                                            <td class="text-left">
                                                <span class="name"><?php echo $option['style']; ?></span>
                                            </td>
                                            <td>
                                                <?php foreach ($option['coolfilter_group'] as $value) { ?>
                                                    <span class="value"><?php echo $value['name']; ?></span>
                                                <?php } ?>
                                            </td>
                                            <td class="text-right"><?php echo $option['sort_order']; ?></td>
                                            <td class="text-right"><?php echo $option['status']; ?></td>
                                            <td>
                                                <?php foreach ($option['action'] as $action) { ?>
                                                    <a href="<?php echo $action['href']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    <?php } ?>
                                <?php } else { ?>
                                    <tr>
                                        <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                                    </tr>
                                <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>