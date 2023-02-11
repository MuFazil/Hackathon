<script>
import Web3 from "web3";

const contractABI = [
  {
    inputs: [],
    stateMutability: "nonpayable",
    type: "constructor",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        indexed: true,
        internalType: "address",
        name: "approved",
        type: "address",
      },
      {
        indexed: true,
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "Approval",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        indexed: true,
        internalType: "address",
        name: "operator",
        type: "address",
      },
      {
        indexed: false,
        internalType: "bool",
        name: "approved",
        type: "bool",
      },
    ],
    name: "ApprovalForAll",
    type: "event",
  },
  {
    anonymous: false,
    inputs: [
      {
        indexed: true,
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        indexed: true,
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        indexed: true,
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "Transfer",
    type: "event",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "approve",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
    ],
    name: "balanceOf",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "getApproved",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
    ],
    name: "getPass",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [],
    name: "getPassLeft",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "getRateOfPass",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "getSpecialPass",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "owner",
        type: "address",
      },
      {
        internalType: "address",
        name: "operator",
        type: "address",
      },
    ],
    name: "isApprovedForAll",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "name",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "ownerOf",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "safeTransferFrom",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
      {
        internalType: "bytes",
        name: "_data",
        type: "bytes",
      },
    ],
    name: "safeTransferFrom",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "operator",
        type: "address",
      },
      {
        internalType: "bool",
        name: "approved",
        type: "bool",
      },
    ],
    name: "setApprovalForAll",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "limit",
        type: "uint256",
      },
    ],
    name: "setMaxSupply",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "rate",
        type: "uint256",
      },
    ],
    name: "setRateOfPass",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "string",
        name: "tok_uri",
        type: "string",
      },
    ],
    name: "setTokenURI",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "bytes4",
        name: "interfaceId",
        type: "bytes4",
      },
    ],
    name: "supportsInterface",
    outputs: [
      {
        internalType: "bool",
        name: "",
        type: "bool",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "symbol",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "tokenURI",
    outputs: [
      {
        internalType: "string",
        name: "",
        type: "string",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "from",
        type: "address",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "tokenId",
        type: "uint256",
      },
    ],
    name: "transferFrom",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
];
export default {
  data() {
    return {
      passAmount: null,
      passLeft: null,
      supply: null,
      tokensOwned: null,
      NFTs: [],
      metamask: false,
    };
  },
  mounted: function () {
    setTimeout(async () => {
      console.log("Start");
      if (ethereum.selectedAddress != null) {
        this.metamask = true;
        const myAddr = ethereum.selectedAddress;
        window.web3 = new Web3(web3.currentProvider);
        const contractAddress = this.$route.params.contract;
        const contract = new web3.eth.Contract(contractABI, contractAddress);
        this.passAmount = await contract.methods.getRateOfPass().call();
        this.passLeft = await contract.methods.getPassLeft().call();
        this.supply = 10;
        this.tokensOwned = await contract.methods.balanceOf(myAddr).call();
        let tok_got = 0;
        let counter = 1;
        let tokens = [];
        while (tok_got.toString() !== this.tokensOwned) {
          console.log(tok_got);
          console.log(this.tokensOwned);
          const owner = await contract.methods.ownerOf(counter).call();
          if (owner.toLowerCase == myAddr.toLowerCase) {
            tok_got += 1;
            tokens.push(counter);
          }
          counter += 1;
        }
        for (const id of tokens) {
          this.NFTs.push({ name: "EPASS", id: id });
        }
      }
    }, 1000);
  },
  methods: {
    async connect_metamask() {
      await ethereum.enable();
      window.location.reload();
    },
    async getPass() {
      const contractAddress = this.$route.params.contract;
      const contract = new web3.eth.Contract(contractABI, contractAddress);
      const myAddr = ethereum.selectedAddress;
      // .send({
      //   // used first account from your wallet.
      //   value: "1000000000000000000",
      //   from: (await web3.eth.getAccounts())[0],
      //   gas: await tx.estimateGas(),
      // })
      const tx = contract.methods.getPass(myAddr);
      //   const receipt = await tx

      contract.methods
        .getPass(myAddr)
        .send({
          value: this.passAmount,
          from: (await web3.eth.getAccounts())[0],
        })
        .on("transactionHash", (txhash) => {
          console.log(`Mining transaction tx: ${txhash}`);
        })
        .on("error", function (error) {
          console.error(`An error happened: ${error}`);
        })
        .then(function (receipt) {
          // Success, you've minted the NFT. The transaction is now on chain!
          console.log(
            `Success: The NFT has been minted and mined in block ${receipt.blockNumber}`
          );
        });
    },
  },
};
</script>

<template>
  <div class="bg"></div>
  <div class="passes">
    <button v-if="!metamask" @click="connect_metamask" class="primary-btn">
      CONNECT METAMASK
    </button>
    <div class="passinfo" v-if="metamask">
      Pass Amount: {{ passAmount }} Wei
      <div>
        <button @click="getPass">Get Pass</button>
      </div>
    </div>
    <div v-if="metamask" class="nfts">
      <div class="nft" v-for="nft in NFTs">
        <img src="/ticket.png" alt="" />
        <div class="info">PASS ID: {{ nft.id }}</div>
      </div>
    </div>
  </div>
</template>
<style scoped>
button {
  margin: 10px;
  width: 200px;
  height: 40px;
  font-size: 15px;
  background-color: #e0460ab2;
  border: none;
  border-radius: 5px;
  color: #fff;
  font-weight: bold;
  box-shadow: 0 0 10px 0px #444;
}
.passinfo {
  background: rgba(255, 255, 255, 0.2);
  border-radius: 10px;
  margin: 10px;
  padding: 10px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 255, 255, 0.3);
}
.primary-btn {
  position: absolute;
  top: calc(50vh - 20px);
  left: calc(50% - 200px);
  border: none;
  height: 50px;
  border-radius: 5px;
  width: 280px;
  padding-left: 50px;
  color: #111;
  font-weight: 400;
  font-size: 18px;
  font-weight: 600;
  background-image: url("/metamask.png");
  background-size: contain;
  background-repeat: no-repeat;
  background-color: #fff;
}
.passes {
  left: 0;
  top: 0;
  color: white;
  position: absolute;
  width: 100%;
}
.nfts {
  margin: 10px;
  display: flex;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 10px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 255, 255, 0.3);
  justify-content: center;
  flex-wrap: wrap;
}
.nft {
  background: #444;
  height: 100px;
  width: 300px;
  margin: 10px;
  border-radius: 10px;
  padding: 10px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 16px;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  border: 1px solid rgba(255, 255, 255, 0.3);
}
.nft > img {
  width: 100%;
  border-radius: 10px;
  opacity: 0.9;
}
.nft > .info {
  width: 100%;
  border-radius: 10px;
  position: absolute;
  margin-top: -50px;
  margin-left: 215px;
}
</style>
