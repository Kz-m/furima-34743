const pay = () => {
  Payjp.setPublicKey(process.env.FRMAPP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault(); /* Ruby on Railsにおけるフォーム送信処理はキャンセル*/

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_form[number]"),
      cvc: formData.get("purchase_form[cvc]"),
      exp_month: formData.get("purchase_form[exp_month]"),
      exp_year: `20${formData.get("purchase_form[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
       /* status = HTTPステータスコード response = そのレスポンスの内容が含まれる。 if HTTPステータスコードが200のとき(=処理が完了したとき)のみ、トークンの値を取得する*/
      if (status == 200) { 
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit(); /* JavaScript側からフォームの送信処理(5行目で送信処理をキャンセルしているため)*/
    });
    
  });
};

window.addEventListener("load", pay);