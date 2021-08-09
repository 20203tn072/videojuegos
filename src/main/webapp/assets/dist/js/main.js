$('[id^="btn-delete"]').click(function() {
    let code = $(this).attr('data-code');
    let text = $(this).attr('data-text');

    $('#id').val(code);
    $('#text-delete').text(text);
});

$('[id^="btn-details"]').click(function(){
    let id = $(this).attr('data-code');

    $.ajax({
        type: 'POST',
        url: 'http://localhost:8080/servletsAsync_3C_war_exploded/findById',
        data: {
            action: 'findById',
            id: idGame
        }
    }).done(function(res){
        console.log(res);
        let game = res.game;

        $('#lbl_name').text(game.idGame.name);
        $('#lbl_imgGame').text(game.imgGame);
        $('#lbl_datePremier').text(game.date_premiere);
    });
});