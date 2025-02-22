// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MyContract - Smart Contract Sederhana untuk Menyimpan dan Memperbarui Pesan
/// @author RobertSmitY
/// @notice Kontrak ini memungkinkan pengguna untuk menyimpan dan memperbarui pesan di blockchain
contract MyContract {
    /// @notice Variabel untuk menyimpan pesan
    string public message;

    /// @notice Konstruktor untuk menginisialisasi kontrak dengan pesan awal
    /// @param _message Pesan awal yang akan disimpan di blockchain
    constructor(string memory _message) {
        message = _message;
    }

    /// @notice Fungsi untuk memperbarui pesan
    /// @param _newMessage Pesan baru yang akan disimpan
    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }

    /// @notice Fungsi untuk mengambil pesan yang tersimpan
    /// @return Mengembalikan pesan saat ini
    function getMessage() public view returns (string memory) {
        return message;
    }
}
