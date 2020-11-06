<script context="module" lang="ts">
  import type { PreloadContext, Page } from "@sapper/common"

  export async function preload(this: PreloadContext, page: Page) {
    const limit = 10
    const offset = parseInt((page.query?.offset as string) ?? "0")
    const res = await this.fetch(
      `https://pokeapi.co/api/v2/pokemon?limit=${limit}&offset=${offset}`
    )
    return { pokemonList: await res.json(), limit, offset }
  }
</script>

<script lang="ts">
  import type { PokemonList } from "../pokemon-types"

  export let pokemonList: PokemonList
  export let limit: number
  export let offset: number

  $: previousOffset = offset - limit >= 0 ? offset - limit : undefined
  $: nextOffset = offset + limit < pokemonList.count ? offset + limit : undefined

  const extractIdFromURL = (url: string): string => {
    const match = url.match(/.*\/(\d+)\/?$/)
    return match ? match[1] : ""
  }
</script>

<style>
  ul {
    padding: 0.1px;
  }

  li {
    list-style: none;
    margin: 5px;
  }

  li > a {
    display: block;
    padding: 5px 15px;
    border: 1px solid rgb(0, 162, 255);
    border-radius: 5px;
    text-decoration: none;
  }

  li > a:hover {
    background: rgba(255, 255, 255, 0.4);
  }
</style>

<svelte:head>
  <title>Podedex</title>
</svelte:head>

<ul>
  {#if previousOffset != undefined}
    <li><a href="/?offset={previousOffset}">Previous</a></li>
  {/if}

  {#each pokemonList.results as result}
    <li>
      <a href="/{extractIdFromURL('' + result.url)}">#{extractIdFromURL('' + result.url)}
        {result.name}</a>
    </li>
  {/each}

  {#if nextOffset != undefined}
    <li><a href="/?offset={nextOffset}">Next</a></li>
  {/if}
</ul>
