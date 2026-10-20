Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.134
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513215;
	b=dNfOnDDUmCL/8JZOEtfi9C6HYRydcy9Bige5sSxucREdEjSHs/yDI5IIiSNVGnOyRBMG
	 vMI4mWyHRLLfaoJ+F4WWRzuWGoG3rwkalx33umIBNNf6mqcp7Bed5CQyiEAU3fROi0AND
	 jemkJDSAG/wM8MldMgHLxw7Vd0FuJTW+WxGB25GnDSuBm1LURLwz35JpibnbV2cVWV1Cf
	 VuN3Sd8NCYC7mWcqrpBJl0zPU3xKjY6lQCRQ7fHLDo8vNU1Lm87g4HEZ+fZfsIiVs4kga
	 Gc1DtCRwMgnFTXr4oGGz5q++cOvD2M9rHPuequPMVF0TNd2sYZ7krvUT6cyd6Nkw6hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513215;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=y3rrQK64tyrJszoSXwqhvzQqzdqhHEKRE2n/anY+pY8=;
	b=gfUzopqIsh/NAQBJFhRo5Qg/o238DTPtJ3MEd9EwQDoTTiaanVnAo8UvfNErLEQwrCki
	 H30HJKd5XhX1v6NwzTBYDUih3gMH7X6eO2wbMxmrlJBA47C5y1wbWy5YwXN2dj0jBxC91
	 QT/qEJwoIDKhnE0Z8zzRlwEbG6OT3NYs4/kQYi4NShlHHwXl3DDGbYe2Q+aEUn0PBJwWD
	 35NU6JW/6NzLoEomqsbpnB1CBdMeS0jEymGNGVnmQUUrU77SF9Uqhk0QoASyROK3PHum4
	 ZVZc/VPlOBchsdgnbDwlr7VR4Cm/j5pcSFACN1immhQNPZuS1GlPIdbrvO79Zmksb3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-matrix.ai;
	spf=pass smtp.mailfrom=d-matrix.ai;
	dkim=pass header.d=d-matrix.ai header.i=@d-matrix.ai header.a=rsa-sha256 header.s=selector1 header.b=dApqN28Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.134
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020134.outbound.protection.outlook.com [40.93.198.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8360A2600
	for <dtrace@lists.linux.dev>; Tue, 20 Oct 2026 16:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A8360A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=d-matrix.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-matrix.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=d-matrix.ai header.i=@d-matrix.ai header.a=rsa-sha256 header.s=selector1 header.b=dApqN28Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4lD4uXBEEE1S1ixqvihUxrOmGuxAVYfGpC6YyZe2yPubNTel1Ht9k8DHIb9nlmR/9dZgcPI3z52rGwNEo/WJZYUG4AXQNTDZ+vn7YnY/RwKlepByPLzqnCZMhfWqWRyT/pvr0CcvtJskjuJwaiG3c1JxOpmLkCvjEDa1fciniKUCYkWJD8g2ZaxmQO0KmWIwPQWDBLszW6bbXunQ0lDqANMLzjyB1RGe83b9MKyVUnqTdSfuCOTuR6onVb9STjidbCiNTa/OTKPVR/BudkC8Nr1dRxcLyRsXs/zuL1TRPEwnLEmJQjbkKbzR8fwcmqEIQ6WriN1a9fnyMuhwqz2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3rrQK64tyrJszoSXwqhvzQqzdqhHEKRE2n/anY+pY8=;
 b=fswXwUfjzxrjeaytBvXmTlIq9Ewh35Gum8dgpaT+AwWY2MNhWpmV5oUcDOBWT4+trpMqivZteSJTWFqXdxHhX5dd6e/3W9jag+gvmKzZ6LdJ6IfbxYFdqzi3AL/Wqob5TmP7imbug0MmnNwtoG+oxsfTyQ9pbZ3dJP1C7lS9tuf0e+anxgUTABiTbd3azKCzDjfoAcnByc0yad5G3uZduvA7t5js0RfU6ES/eE113y72M4BDWERCj23BDiqtnt9UtUcDXlBX4hf3DT0+8Oe02zxt+lWdKXDby433IA5WFYIg5x7vla9Kkn2hBlq/QptPvD5hREV6WZ2aeZxHrcYECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d-matrix.ai; dmarc=pass action=none header.from=d-matrix.ai;
 dkim=pass header.d=d-matrix.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-matrix.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3rrQK64tyrJszoSXwqhvzQqzdqhHEKRE2n/anY+pY8=;
 b=dApqN28YeKBLR+kV9eC3Gc8oAiuyEksv4qls3iZ5oBkUuiaSpDGVQJOk3EzJWkuW+rt1L0XFfpjfB5leTCi2Vq9v6mCUXmREqS8eN4cIvL6CDY7AkbBnguMG4rVRnGUSYPdZb1g+s5N6oJOptLYI4t6ruvHJLbBBuNCm+mzkMVw=
Received: from DM3PPF78E03B81B.namprd22.prod.outlook.com
 (2603:10b6:f:fc00::e29) by DS0PR22MB4095.namprd22.prod.outlook.com
 (2603:10b6:8:116::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 16:20:09 +0000
Received: from DM3PPF78E03B81B.namprd22.prod.outlook.com
 ([fe80::94b6:a8ba:f26b:7ac]) by DM3PPF78E03B81B.namprd22.prod.outlook.com
 ([fe80::94b6:a8ba:f26b:7ac%8]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 16:20:09 +0000
From: Eslam AlMorshdy <ealmorshdy@d-matrix.ai>
To: "devnull+ealmorshdy.d-matrix.ai@kernel.org"
	<devnull+ealmorshdy.d-matrix.ai@kernel.org>
CC: "alan.maguire@oracle.com" <alan.maguire@oracle.com>,
	"dtrace-devel@oss.oracle.com" <dtrace-devel@oss.oracle.com>,
	"dtrace@lists.linux.dev" <dtrace@lists.linux.dev>, Eslam AlMorshdy
	<ealmorshdy@d-matrix.ai>, "eugene.loh@oracle.com" <eugene.loh@oracle.com>,
	"kris.van.hees@oracle.com" <kris.van.hees@oracle.com>,
	"nick.alcock@oracle.com" <nick.alcock@oracle.com>
Subject: Re: [PATCH 0/2] Fix pid probes on noninvasively grabbed processes
Thread-Topic: [PATCH 0/2] Fix pid probes on noninvasively grabbed processes
Thread-Index: AQHdYK7gat25y4Bfzk694YNEJLnbuA==
Date: Tue, 20 Oct 2026 16:20:09 +0000
Message-ID: <22BD27FA-8CE2-4DE0-8B16-FB91D0945494@contoso.com>
In-Reply-To:
 <<20261018-bug005-pid-noninvasive-names-v1-0-417b0f34f0b8@d-matrix.ai>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d-matrix.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF78E03B81B:EE_|DS0PR22MB4095:EE_
x-ms-office365-filtering-correlation-id: 2a7ad5d5-edba-438d-26b1-08df2ec602d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|56012099006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 zzEfSexPo1gCnIhAg8Z91M05/wnYKZS2GxBfzFUYh2MHFDVs4oenhjxd/nLafMm7GW9oPOA0IfhFBoIJkFZAHYsq0hzAqSKRInSiESWmAIwBasaGPyvBO5+25M/hUXQ5hx1qQpBWagYqjxYzMVkvV5R9ILxO/1O9lGDgyghu29LvzwV2GBjAyTD2HoAVGyVUtlTLNK6BXZbz7hpJ9xx8MM8znB53HqDqEkVGxMMF+E46VULuleBb81BHYJVIpSyfPqKJxliKynNqyfmUfx4fuXLKbWHVEVtDwaMAb21d0CBE1tBPPBkPfC2Nj7aCNy3WnnFulWANZh5GWcdJ3UyPlEGJOtk2DyPNSKc0vw2Cf2kLwSa1i6uGPyyMKh7W0KjK/Tq6xU/m+5mN7/mbDgGK9W2pReNkS9I2DR8NlHqsEGZGg552BUlUs27RxHkCcEsSMhkzfnFLW8xUSA8fslghH0moEIPjlVagykIJaC7rkZKTsQ5RS7gdYyvPAsOtiLVIKcriCgHTIvlX2eMR88auRcM6x4c4OYKKaLw/s1ty8yJSj3A1hy4E5MhWvXlc+G5adfoDfXDx75ABLDxK3hK2pZ9mlmdVakhUrfSWl6F+u4HW2bn2u6BHeChpyWoYKYFaP7ZxXhVZMecXCFx+Y/rb1luuPLLG4VtDvjO1FRJIuQsrCs+WByfkp1XPx+fRz9tq0Wqd7q9W+ezOqay0f8+V5oU7dCQ/OWo7DPDtwYE7DYo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF78E03B81B.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OU9qOXVpc3NYN1pQY1pGaklmV05vZ29DOGxsamZ5cG1EblMycXRaZ2VleE5p?=
 =?utf-8?B?d0xIZ3BFWDF5VE5JYk8rbVpZTEVrbGRTZUNuWFNUN0VSU1B4SithZ2g5T2FE?=
 =?utf-8?B?WlJGTEszVjdUOVdwMndTVVI5WEJybnBZRHVKbS8xdnZzUXVRYkd0SU03c1B1?=
 =?utf-8?B?S1hJRUJGWjhiSEcwS2xyY2RZUURGVDdRL0czVDRJNWtET0Zpdkd0bWNwSlRu?=
 =?utf-8?B?dmpuWnhmS1FHVmtQdzkzazl5WStUY2t5NS9GM2JKRUdPNE5rWEY4c1V1eksv?=
 =?utf-8?B?OW9aMTdkcWVrcTM0QmtqQ3puUjhBS055NUxuZkR0d2lUM0dhZEY0VDlKTWN0?=
 =?utf-8?B?TXVJdkt0Z01ldlJoSktxUXF6cXVvNEhQMUxkeFA0Qm5yeUJjejNibzYrU0dS?=
 =?utf-8?B?MVNiR1FCSzJUdmVJaG80UFp0WDNFek9VTHFCQnlGUERVU0J1S3FQK0N6T1Ny?=
 =?utf-8?B?cWt0ckpRTHk2VVFRUWEycDZtUjlCSjRFckwySWNHZmxzNTJrRk1nY0IzVEhu?=
 =?utf-8?B?WXhNbGJNMW1tSnpjZmFDa3VzcnpDdzcvSDU1aVFETmFzbmNzRmRUQWNYSnA2?=
 =?utf-8?B?aG9oYzlXQlhsMWZaaGxjUUF2bGFNQ2FDaERTNDBXM0ZDTi9PdWlyM3IrVFRM?=
 =?utf-8?B?bjd3SWNlMzdvYmcvdkVqR1FQOEVFR3hFcm55dHE5NkhJTWVYWlc4TnFzU21C?=
 =?utf-8?B?c0lpOFU0cG9rTW40RDVrdkV4Tm90STAxTWErWTZ1TVF4N3IxMlBzSEtXbG04?=
 =?utf-8?B?bjN5YUlacTBvTXgyY3MrS0tUNGk5ZS92SC9qdE4vd3NJS3lhclBUSkxWM2pE?=
 =?utf-8?B?emRZQVZwSE9zOTBONVRZWC9wZU5UcFd1Vi9uaWV3Tm5hQWhLbFVrUzROV2t5?=
 =?utf-8?B?TWJ3UGlnOCtiVWp6RlBFOWZEeks4UThqUWY1M24yenBzR3ZKQzA2S3lsSkxR?=
 =?utf-8?B?Nml0MEhEaGZPdGpqRFdmVFpEM1ZjdUpFTFJnbC9kVExZZEhhQUl2QmR6YTJV?=
 =?utf-8?B?WVU3cVpDK3QxdW5JaDdBTUtYVW5jNzJXRFh2a05rTkQzOFVmWHVpUFhiZ3p2?=
 =?utf-8?B?ZFcrUkYrN2xWbHJ3VDFUYjkrbjlKUzMvNXQ4SWRaV0pEV3JpZ0ZWQ0hCZlQ3?=
 =?utf-8?B?NHdWNE03dmxnQ1VVcWx2a0tTQ2lUR3NmZ2x3Qi9NMGpGc01WT0FZaEh5Nm1m?=
 =?utf-8?B?V1ZTSjF2bWE1aGkrTUxTRnhnVjZkeEJxdE0wNE1mVkw2SVNSWG1oSTZhWGZ6?=
 =?utf-8?B?dU5INnd2UHk1ZnhsUWc5R0g2VGs5ZG1rd09IZnZiczFKNkhYQklFaXk5WlFY?=
 =?utf-8?B?NitLRld4TU00WnhkbkwyYmVVT2t0WGRDZG4yQ2VkelV3dE1GNFo1S00yeER3?=
 =?utf-8?B?aXh0VUpNZHJGS2VPTSszWDkyTmdUak9IK0pUSXdRazB0M0FjUUhvWGo5c1Nn?=
 =?utf-8?B?UXdPeVl3SjlVQzIrcWIzVHN2SjNldGlpanI1bVpSeGRMTDBJVmkvM2tMS2lX?=
 =?utf-8?B?RWtOWGYxYm5zWktuYTN0Q1gra0Rab3dTcW5mSlZQVHMweTU0aCtPTG9lTFhy?=
 =?utf-8?B?QTRYdHFyRjRsR3U4NGxEV3Y3Yjd5K2pEa2RjcTAwSmNVeEJjemVyeE5kRFFv?=
 =?utf-8?B?QzVxREpFRnZRaFd6OTA0dDNHVEhYbjZ5eHF0SGEybXFVQ0xablZ4Q0pLYzhJ?=
 =?utf-8?B?VGxKMzJ6NGk1emtYbG1NNmxoaXlXOGtOV1FaQzBiVFRyRnJTYlFGbUVub0Rk?=
 =?utf-8?B?OWZaWldIczNOQjluMllFeXVFVU9TMkRSR3oyQWJ1SXRsUGFqaWdMaGp2MjRk?=
 =?utf-8?B?KzA3aHZGQk92VkVSRi9memREeFVpazFrYUw4aUUxQm5UZFM1cUFIUG1oZzZL?=
 =?utf-8?B?Z2hNTjgvbFk5WWV1Rnp1OUxxWlJGVG9JVGpsdys4c001K1hSUEJYVHFnM2x0?=
 =?utf-8?B?RHRTaFUyVDBGZytoQW5iYzFZN0E5b1JjWGRscnJQQ2pUU2FwU1h3Sk0yejBm?=
 =?utf-8?B?QmxPYXUwOG5GcmF0bVQ2SExnZUZBUUZyaWxBM3Q4OGFJSm4rcGRUdzlsOFEy?=
 =?utf-8?B?NWxBN1JsajM5RkYrUjV2MEpCeG9uR05JT2pycTRsSDJ5R2VMK2dlb1duV0No?=
 =?utf-8?B?TjF5ZWFaODROb1BDSk1UQy9hWTZNVERDSGQwN2VqQVVBSUZLZEEvSVgycUZi?=
 =?utf-8?B?UnpyZTNQREdicmZpOFRKWTQvL0NrZWx2blJNNzAyRjJvK2lYNmJHQ0g1bWI2?=
 =?utf-8?B?VXVLdTRNTVlqQWsvVW1adHZOaFh5SnJFbFFSN3BzUzJ4Wk1kK2svcm1pSnMv?=
 =?utf-8?B?VWxUVUVleitrRkRYL1JKa2c5TnFVVW16TUlPQ0VmS0V4aE14VlBsdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CEC8B5524BF6C440882FEE96523545E2@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: d-matrix.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF78E03B81B.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7ad5d5-edba-438d-26b1-08df2ec602d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 16:20:09.5128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 656d4e6f-3fcf-4ab1-80d1-71331c6f3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+ILVrPfcOcPHUznMvficQDWEmkiOD25yOUXubgZb9yFCzxVAgprvoCBSOhEkpDsFcGtIoqFVwx/lDdFW8ShLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR22MB4095

U29tZSBjb250ZXh0IHRoZSBjb3ZlciBsZXR0ZXIgbGVhdmVzIG91dDogd2hhdCBwYXRjaCAxIGFk
ZHMgdG8NCm5vbmludmFzaXZlIGdyYWJzLiAgVW50aWwgbm93IGV2ZXJ5dGhpbmcgdGhhdCB1c2Vk
IHRoZW0gc3RhcnRlZCBmcm9tDQphbiBhZGRyZXNzOyBwYXRjaCAxIGxldHMgdGhlbSBhbHNvIGZp
bmQgb2JqZWN0cyBieSBuYW1lLg0KDQpDb21taXQgZTY1ZDA2MmMgYWRkZWQgbm9uaW52YXNpdmUg
Z3JhYnMgaW4gMjAxNSBzbyB0aGF0IHN5bWJvbHMgaW4NCnN5c3RlbSBkYWVtb25zIHN0aWxsIHJl
c29sdmUuICBTaW5jZSB0aGVuIHRoZXkgaGF2ZSBzZXJ2ZWQgdXN0YWNrKCksDQp1c3ltKCksIHVt
b2QoKSwgdWZ1bmMoKSBhbmQgcHJpbnRmKCkncyBzeW1ib2wgZm9ybWF0cywgd2hpY2ggdHVybiBh
bg0KYWRkcmVzcyBpbnRvIGEgbmFtZSwgYW5kIFVTRFQgcHJvYmVzLCB3aGljaCBhcmUgcGxhY2Vk
IGF0IHRoZQ0KYWRkcmVzc2VzIGR0cHJvYmVkIHJlY29yZGVkLiAgbGlicHJvYyBmaW5kcyB0aGUg
bWFwcGluZyB0aGF0IGNvbnRhaW5zDQp0aGUgYWRkcmVzcywgYW5kIFBvYmpuYW1lKCkgbmFtZXMg
aXRzIG9iamVjdCBieSBsZC5zbydzIG5hbWUgb3IsDQp3aXRob3V0IG9uZSwgYnkgdGhlIGZpbGUg
aXQgaXMgbWFwcGVkIGZyb20uDQoNCnBpZCBwcm9iZXMgZ28gdGhlIG90aGVyIHdheSwgZnJvbSBh
IG1vZHVsZSBuYW1lIHRvIGFuIGFkZHJlc3MsIGFuZA0KNGFlYzVjOTkgbWFkZSB0aGVtIHRoZSBm
aXJzdCB1c2VyIG9mIGEgbm9uaW52YXNpdmUgZ3JhYiB0aGF0IG5lZWRzIHRvDQpmaW5kIGFuIG9i
amVjdCBieSBuYW1lLiAgbGlicHJvYyBkb2VzIHRoYXQgb25seSB0aHJvdWdoIHRoZSBuYW1lcw0K
bGQuc28gZ2l2ZXMgZWFjaCBvYmplY3QsIHdoaWNoIGNvbWUgZnJvbSBydGxkX2RiLCBhbmQgYSBu
b25pbnZhc2l2ZQ0KZ3JhYiBoYXMgbm8gcnRsZF9kYi4gIFBhdGNoIDEgZmFsbHMgYmFjayB0byB0
aGUgbWFwcGVkIGZpbGUncyBuYW1lLCBhcw0KUG9iam5hbWUoKSBhbHJlYWR5IGRvZXMuDQoNCkVz
bGFtDQoNCg==
