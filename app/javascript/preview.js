if (document.URL.match(/sign_up$/) || document.URL.match(/users$/) || document.URL.match(/edit$/)) {
  document.addEventListener('DOMContentLoaded', function(){
    const UserImageList = document.getElementById('user-image-list');

    const createImageHTML = (blob) => {
       // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div');
      imageElement.setAttribute('class', "user-image-preview");
 
      // 表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      
      // 生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      UserImageList.appendChild(imageElement);
    };
    document.getElementById('user-image').addEventListener('change', function(e){
      // 画像が表示されている場合のみ、すでに存在している画像を削除する
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
 
      createImageHTML(blob);
    });
  });
}