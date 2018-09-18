  // const translate = require('google-translate-api');
  //
  // const allTheCards = javaArticle.map((lang, index) => {
  //   return (
  //     `<article class="translate-card">
  //       <section>Subject:
  //         ${keyWord}
  //       </section>
  //       <section>Section:
  //         ${lang.subheader}
  //       </section>
  //       <p class="to-translate">${lang.sentence}</p>
  //       <form>
  //         <input type="hidden" name="keyword" id="keyword" value="${keyWord}">
  //         <input type="hidden" name="subheader" id="subheader" value="${lang.subheader}">
  //         <input type="hidden" name="sentence" id="sentence" value="${lang.sentence}">
  //         <input class="translate" name="user_translation" type="text" placeholder="input your translation" value="" />
  //         <button class='button'>Submit Translation</button>
  //         <div class='successful-translation' id="${index}" ></div>
  //       </form>
  //     </article>
  //     <br>
  //     <br>
  //     `
  //   )
  // })
  // $('.middle-container').html(allTheCards);
  //
  // $('.button').on('click', function (e) {
  //   e.preventDefault();
  //   let uniqueIdentfier = $(this).closest('form').find('.successful-translation').attr('id');
  //   $.ajax({
  //     type: "POST",
  //     url: baseUrl + "/languages/" + languageId + "/search",
  //     data: $(this).closest('form').serialize(),
  //     success: function(response) {
  //       jQuery(`#${uniqueIdentfier}`).html(response);
  //     }
  //   });
  //   $(this).prop('disabled', true);
  // });
