<script context="module" lang="ts">
  import type { PreloadContext, Page } from "@sapper/common"

  export async function preload(this: PreloadContext, page: Page) {
    const id = parseInt(page.params.id)

    const res = await this.fetch(`https://pokeapi.co/api/v2/pokemon/${id}`)
    return { pokemon: await res.json(), id }
  }
</script>

<script lang="ts">
  import type { Pokemon } from "../pokemon-types"

  export let pokemon: Pokemon
  export let id: number
</script>

<style>
  main {
    padding: 15px;
  }

  img {
    display: block;
    image-rendering: pixelated;
    width: 200px;
    height: 200px;
    margin: 0 auto;
  }
</style>

<svelte:head>
  <title>#{id} {pokemon.name} - Podedex</title>
</svelte:head>

<main>
  <h1>#{id} {pokemon.name}</h1>

  <img alt="Pokemon" src={pokemon.sprites.front_default} />

  <ul>
    <li>Types: {pokemon.types.map((value) => value.type.name).join(', ')}</li>
    <li>Weight: {pokemon.weight}</li>
  </ul>
</main>
