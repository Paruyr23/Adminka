$(document).on('click', '.categories_trash', function () {
    var modal = confirm('Do you really want to delete?');

    var id = $(this).closest("tr")[0].cells[0].innerText;
    var deletedTr = $(this).closest("tr")[0];
    if (modal){
        $.ajax({
            url: 'categories_delete.php',
            type: 'post',
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                deletedTr.remove();
            }
        })
    }
});

$(document).on('click', '.models_trash', function () {
    var modal = confirm('Do you really want to delete?');

    var id = $(this).closest("tr")[0].cells[0].innerText;
    var deletedTr = $(this).closest("tr")[0];
    if (modal){
        $.ajax({
            url: 'models_delete.php',
            type: 'post',
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                deletedTr.remove();
                alert("Model has been deleted!")
            }
        })
    }
});

$(document).on('click', '.products_trash', function () {
    var modal = confirm('Do you really want to delete?');

    var id = $(this).closest("tr")[0].cells[0].innerText;
    var deletedTr = $(this).closest("tr")[0];
    if (modal){
        $.ajax({
            url: 'products_delete.php',
            type: 'post',
            dataType: 'json',
            data: {id: id},
            success: function (data) {
                deletedTr.remove();
                alert("Product has been deleted!")
            }
        })
    }
});
