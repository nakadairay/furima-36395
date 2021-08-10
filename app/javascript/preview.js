function preview(){
  if ( document.getElementById('item-image')){
    const ImageList = document.getElementById('image-list');
    document.getElementById('item-image').addEventListener('change', function(e){
      const imageContent = document.querySelector("currentThumb");
      if (imageContent){
        imageContent.remove();
      }
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
  
      const imageElement = document.createElement('div');
      imageElement.id = "currentThumb"
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  };
};

window.addEventListener('load', preview);