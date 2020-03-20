<tbody>
<tr>
    <th><?= $value['id'] ?></th>
    <td><?= $row[$key]['models_name'] ?></td>
    <td><?= $value['categories_id'] ?></td>
    <td><?= $value['pubdate'] ?></td>
    <td><?= $value['update_date'] ?></td>
    <td>
        <a href="models_update_page.php?id=<?= $value['id']?>&categories_id=<?= $value['categories_id'] ?>" class="pencil"><i class="fa fa-pencil" aria-hidden="true" style="color: green;font-size: 30px; margin: 0 5px;"></i></a>
        <a href="#" class="models_trash"><i class="fa fa-trash-o" aria-hidden="true" style="color: red;font-size: 30px; margin: 0 5px;"></i></a>
    </td>
</tr>
</tbody>