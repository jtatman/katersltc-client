from bitcoinlib.wallets import HDWallet
wallet = HDWallet.create('walletOne')
key1 = wallet.new_key()
print(key1.address)
