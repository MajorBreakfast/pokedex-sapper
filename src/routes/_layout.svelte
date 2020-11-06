<script>
  export let segment
</script>

<style>
  :root {
    background: rgb(79, 36, 128);
  }

  .pokedex {
    background: rgb(252, 53, 53);
    margin: 30px auto;
    box-sizing: border-box;
    width: 500px;
    border-radius: 20px;
    padding: 30px;
  }

  .pokedex > div {
    background: rgb(41, 51, 63);
    color: white;
    border-radius: 5px;
  }
</style>

<div class="pokedex">
  <div>
    <slot />
  </div>
</div>
