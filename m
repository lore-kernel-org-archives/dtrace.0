Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49E45003
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328582; cv=fail; b=sa4xbH5CG4fvTORP/yXBYhp5/BwVB+jvl4XVIe3j2H3KQMvbn5WwKsn/diEOhPUNXOky2Pi/QN9E78x3BrCSfy1Du6HlTGG1GRiGvPlT074FzgSHUORCEFu5ayBvHW2BC9Jn7sTc2WHotDyNvTHYyAegkVaXr2bc1yJcjHeidd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328582; c=relaxed/simple;
	bh=ib56dPkWg49HyBfN8uBQ1V2Mt4w0c9jMtkIV8ec2AGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DnTh4Rg9qncujukpenQNYy6w9QoAN5llpL/liOBYSkVgITrsdu2jGrV1Hml6Rlr7qaCVIQJ1mezLtUWII3jy9XW4EcMgFs1NELnfNmxZxF1sSDtB1IYjupwv31zXWhEIWtXndPcGHRtppmqNe/11+G9KJRfvGtkQx0VlLMfNACc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fb/m+KKS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YKijdUUa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fb/m+KKS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YKijdUUa"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIZ1NT024717
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=rKIm6giG0Cw2IKb
	3T2Nf0AjGtxJZfxcW+PPaRhFNcPQ=; b=Fb/m+KKS1D8nc+WMqO94KeTkCn2QCc0
	ogUWZBbF5M3QuS69EyEX6vYjq7hLUwHspy4i18TrqGBotuNyaEctZElTTqrWeGWn
	GuexY/qUGDpMMyyEC8TWkinHu6E+kNGu8fujwlxCH21tdyv70RrmP5UQWRI8Alb0
	tPK+Il56F1cpZB+7nRfldBYwXVIspmwnVKN6l5OctsWzCZnecZraqxVyxBGxSw2l
	6umxJLfU7qGBsgy3jm+wmKOrd/YgTSRrOuMsSf9JsAs/clYu5PM+f3gr3rU6kfgW
	be9XnOMvEr1WPp+ZUYX15kBjK0gXF+mWhqekleo3FE2zbMvb81L0S9Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8f4r1av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IIjnKg031717
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf068e8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSNaIL/43bt/QLOMP4lxVbl4Z8NbydpVu/s/N4A4CUQNvZ074KgZkHKM8olEU0KrIsnGFveWCV9BnOxeC+AWN082Rj8hMRiQg5D90Z210Rc1sHujmJ3mcTfToEDcToyBl9kmrvu5nag/rpFVV3o++wuhHSlTv5bOPq2fTzuYhfR/nyphUdwEHXyxQRUALpAf6/r6HHCefcSXy2NUOL53TTVZ970wkbxAByLDRQ/TecHuPpqBQjDusS63EcXWHuGNBzYGaSo4PvhbofBe1ro3cRaQT523aeiR6NmVrO7A41JldszVmN+BNYu1BYsHinsVh69d7SvFy9pn4wOanTKTcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKIm6giG0Cw2IKb3T2Nf0AjGtxJZfxcW+PPaRhFNcPQ=;
 b=zTBC+G9zkwmPVEZuwDxAcbLIi0bOY7hUmKdrLijKFbFpRoasZ1q9F7lrINDt49wxChZ6sxC9eQM2U8eDdyvJ3zPEQ55xw4vl5aL3srhXnZnWlOuf2r6AE03x5AXwKkdExEg9vL3dh8VqRV14rxbMRuOu7KQ9fBJLWRzmiQkFyqljGAZ7pBjHgmOfIbNPWSVU52LZzfqoFe72jYkQqnxAHmQzvBWI8i6gBEhbT1cHHNmJTFcp4vItOnq+07Lv3rHI+irs+I7fax7JddWcZYiy3oN0bxZHI0uodWYeZt8Lh5jGYpBCZ+RDN6e0L3+XKL+L62OayvLbvDv3AoFraEX2Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKIm6giG0Cw2IKb3T2Nf0AjGtxJZfxcW+PPaRhFNcPQ=;
 b=YKijdUUaNRv9G3XLcz4W7vPiR9AVuyqFXDviCPeLuOAkyxaSnm1bZVJ13iH8u+CttFTy0FL9Yq0yNhl/6eHviNShbasQRITNmPdjY2yTm1NcYE9Ty9/IE4P82R0btntub0AOalftqE0xel5UgHJliEHdnkyealsKVDH4PkjWMjM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB5211.namprd10.prod.outlook.com (2603:10b6:610:df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 18:49:36 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:49:36 +0000
Date: Thu, 18 Jul 2024 14:49:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 08/38] Fix comment in dt_probe.c
Message-ID: <Zpljvelm6PDad0em@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-9-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-9-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0636.namprd03.prod.outlook.com
 (2603:10b6:408:13b::11) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c38ae71-7e32-4e91-6c96-08dca75a5f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LZl6xS3BY6dJ31FAxPrhme7xVEdyQ4U0DNkDf3+PHy/CllKyroA4jaZg0xvS?=
 =?us-ascii?Q?pUuWMQzg3SI1f60XyVtg+HszOhRRtsE3V3puh+of3T52xtVo5Y4hPY3zajMK?=
 =?us-ascii?Q?Rf95PyJTMQFUT2J93RKVDUc3RZtWH9a2BLwXMJz+CNn322CKLxiJBqgAqm33?=
 =?us-ascii?Q?b2Evvz9SFD/dFdEjYfB9ZUiyQ7S1uo8A6t7gTrWvZE0LHK2WWFpaDAj4CoBF?=
 =?us-ascii?Q?14X7NSKZHCFSxLDldu37X+YT3VhNOZrQFct6IS8WCLyXIr9R5FuYP7ArsuRg?=
 =?us-ascii?Q?uGrqup61D2DvVQ5KTaCpZ4RbpwGbT5sR3ZoYUfcyGygIWQIDkR8CJtsQ3Rny?=
 =?us-ascii?Q?D8s4PayvWt4lHInf628MHz4TJV/6gAmv2L5YLx7LUbogmGUJFzMBGfTUaHPO?=
 =?us-ascii?Q?ZpToXy8pfoqTB0Qot3J9ZMUiechk1VHlWeL3g4E31Puop597U8ns5ODA7OBV?=
 =?us-ascii?Q?9DLJ+2DsSjK5uiLi/MGB6M1rcDLSbZNRDZqjvd8/wWwf+xhD1eXbj1U0dNNj?=
 =?us-ascii?Q?lQpqRyOPF5jhbVlobA9tKXZOfDi2Wr2qY1auhmKZYaeX3LQtc8Tq/I688DzP?=
 =?us-ascii?Q?8h8dBLLxCJoNOY9iB2HHlOMQkOoTZ/CXJH0VlYnJOBboUMErcNbOVNlZJw0Y?=
 =?us-ascii?Q?TooETaoOCJ4xnMtI4AQrraaWeBo+kMbC0XQ5caZBEE+wd14a6lr9deSEsyzD?=
 =?us-ascii?Q?iuhkFprX+ykw5ccNkhLRZkApQKH3+fG5XalJ1kWcuDZB/IjCZ5HpAG0yU+16?=
 =?us-ascii?Q?GJIHXE1q5ceFHN/dUeUZI5vRLijb4byFD7gWM3nFsfLWDo8trUPEqENOyc3W?=
 =?us-ascii?Q?Od1Xx9sz9e4Z/P+S7sIxcgMle9lAxHTr6x2JkT2uALKSNPaeHUHiOQQguemA?=
 =?us-ascii?Q?kaMAAGvhCzXJNFqSaaCJyQih9z/VauoSjT3goP35d5PnvZe+cNICeTBPj9u6?=
 =?us-ascii?Q?6TjyHuf8aT9Gcd+PdW5hnI9aTuzidOwvhpasKGANXZtystpVQP0VXBgBQiTh?=
 =?us-ascii?Q?OWynAI3iGa9m1bWqd+hNLXCcVyG9Em4/Eh2k2AL9N0wh6EdmJwp5SgFqui4i?=
 =?us-ascii?Q?nY4zeLkK0YEllzvT5KZiFROQz5/ZdVjP1722BmbRYFJIUCD6+OPRkeYRu5tZ?=
 =?us-ascii?Q?WYPsR1lC+ibV/RH1Zt8Q/W6wrfFTxqohUyZOc/8Ib2Zg7FEeA6S0PotvMpZQ?=
 =?us-ascii?Q?3sFo3GosAcSnP0uCaKpFR+Il04wBVUCZOGk/UUla2Jd4PyBbBFvv0fYoRl63?=
 =?us-ascii?Q?uVS9rnh1W33MQLN5MJzEYhwW5DEvg4mtosO04tDJXUPBffBipi0bKLKhRYPN?=
 =?us-ascii?Q?0gvzj9yqq5OGJe7zQKtWGdv9FBhmcjoPqKY6MUOq5mrvUQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v3qid/coKuL2ZtVtUUF20CXWQ6oydg/QjPPglppdvn3DDoWrLyaYQCYUTfAK?=
 =?us-ascii?Q?JjoRz0M4qHELkdg6dVs/RWM7WFI+sjEnzoMsun+515iKqZ/2NIaPCXSEiLMd?=
 =?us-ascii?Q?e+bJcsxuHdnkb+3JzR3ZamifhprKB7S+CKFt3XewyHUjQ74rR/PgJ+GXEg6n?=
 =?us-ascii?Q?fA9V1OVT/bIUiba9k4DKoxcoquQxKTlAdlHvTeiKrvPMJFUL/SUrD0rKsBkC?=
 =?us-ascii?Q?Nw5bXp7N1ofPVRNQl/38C10+myml5hdnQhb3dvtcuqbULKRiAvHM98UouzMJ?=
 =?us-ascii?Q?mlmiMJ8ddM/5gGLjUpl3DpFNcvai8KkSDhO5z5z1hcr6KnOCdjo4rEo6OvbC?=
 =?us-ascii?Q?MWqbD3wVRTnB0R50a/fhY29+l44b8nUlPMziE9tezPke8w49kvjQTLPPtZOP?=
 =?us-ascii?Q?JvzS8IrRPk/G7drpkJLB/bKTqx3rX20NFKey8UYbEPOi6f/GuR0+WyJV6yrH?=
 =?us-ascii?Q?4rhLYvAfhxQ1MNLkxv7Wkzt52r5VCLOyKcI/SmjNdWF2uWuqhUxo9Tl3m4Z6?=
 =?us-ascii?Q?q//1W1mKceIFWXRZGGeaGLRLvQgOfr/YABbSatcyqKWXaVxeBR1uho6r8rlc?=
 =?us-ascii?Q?ezeEDrCRlxK9MGrPpYFJNw3Dm4hAfNXhsnIiWO/2WsQAYRC9jRgRSoNDkqHK?=
 =?us-ascii?Q?ScpNqsM5DJQl+jE3FpkADwEJpwQYC+EUipULarN3+N8ngKE5EGrHQGnsAA7i?=
 =?us-ascii?Q?d0qzYMNCAMOOfwmbJuKnKD+a6yT/DAbyETKZ2SW95jR9kDdTkx1hcCtKeBGe?=
 =?us-ascii?Q?ZYMC4y+JEcSj3BqlyGkeM+nv7HA56exoNqFOCqpzbkXCD9MVf1vOGY/XhdER?=
 =?us-ascii?Q?0ggNb1xca0vGD+fpCW3J3ADmiTRaHfTgpVA55b05tnptYx1O7SkpWcqXqBNi?=
 =?us-ascii?Q?9TzgyNdZcBkkThKcre13iGD14qdcf0lUtX+ro9wrJzStICX2iiheO7iZ2cN6?=
 =?us-ascii?Q?o8Fqkgn62eYehbTUhbt08I7d/toOPcHr/Lh7skMCj2koYJFaUEj2RqiHBo7I?=
 =?us-ascii?Q?0BmMtJsiGqX4CkeWn6Rx278TGB2ralv0P/FYd+yNk0TN04dicNucZibiDHrc?=
 =?us-ascii?Q?enEVLTDc/IPBvzP+lfw1c2jCgwJcWroeyqF3B45+uz1l7m2Orq1/XRIFbTPc?=
 =?us-ascii?Q?W/xNuS3C2vCeI9InmWSEre5gYwa1rncm3Wr4nc8/x7hqI8dKRGc/z0suvICD?=
 =?us-ascii?Q?5pohPv9P6MOZaW/ZYj7irfjEJt15+Zfom6tbQbvweo5/UfABxjgJCTB5dl0p?=
 =?us-ascii?Q?dywQHnJjuXHFQdH7UZs3lfIESsDqe0syJC3U0rCVldqIb/K8Bu2cOYuHg2EG?=
 =?us-ascii?Q?VLAFlPBWCdjpr86iarSsBp/kgcORoTD61e9x/c2R0tYDAVYAA2vERpwCowG/?=
 =?us-ascii?Q?5EotauHKgZ0S0zA64Hgj8fJ3oFlXSr1nxDFPoMBb6g2MnJeBC50VfT4nppO1?=
 =?us-ascii?Q?nmuudHIETODhi8ASz8i7K3nTvaAJ7wwiCBA2JNeMB19CduDMf+SZnKiJZZ/P?=
 =?us-ascii?Q?czK9oJGjIPxquVGuEOCr0hgBmhkG5qYwllKbEwtFJhdu0YnEVqH/YiTDrPbe?=
 =?us-ascii?Q?iO1RAz6+cr04UvLh1J64mIgww/2uZXbhb8RggL0pC8vJhRPz6E2ylh0K8Oqb?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	d61xaGVKozXQj/GFZXr3c5lFusdwu98iUqwv1XO3wpl/htD6n/POfs0zIgrgx1fyajKp0RKE1R7SPRVViE42qOWhDX4dRlI+27Y1x/zC7UdfN6s7/jbeaOqYS93a2QI19+BGHqwsaESd3RVg1rS3gDKjb6Kq9x+LSeThJtHSzlUbU1ANPtC/kwR2uBGPMZIr0xvo4hvXEtc+yF9znylwLyIiulzoI25oXGdlJxqdsuhudqz7bYod0x4Oc0OXWrvZM2/v80GyV4hMGFHmfDgDblw/k3V1dNuBeKig1zTbu9PaFOTICdJsquz7J10V2lOO7xsd45NbLFoEJkR1N0/u8Zy3MVid+NBlWvK+FgWMun+qAz2ZgMWd/nATzOHsBIKUNHkFq53CkxyEiPvPknOLizqHeE3aK1AKlfkE099q3ruWKSP+9zOnSIODQ/vwxPFJG/lVZBqgVDUnBXHFZVnUpCDtByjrCLceUNBRhgsYbU2Tdvq87ZToQk/PemuSmzHblVvKti+pdD5Laeu2npuZDY43DgeBRvpk9/a8BRBf9AWEL6JZcxjdsn1iSsOodbxXOwrWAAHcyB/OTCQwFkF4kFz+EBqkQBGoK7rG85WYY6Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c38ae71-7e32-4e91-6c96-08dca75a5f1a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:49:36.5063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +evLIyNqewavZMZh1MpoZ1ubnqW+W12I8LEkX77xVI3tSHAp6Pfap2fNSpxeqY4phXA3zNRSQ1R15T04TXblltAfM9WKju5Hu3UPsoexcfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5211
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180124
X-Proofpoint-GUID: _DUCOpXBRQVv7IfjhK-JR3Aqnl3UJeTC
X-Proofpoint-ORIG-GUID: _DUCOpXBRQVv7IfjhK-JR3Aqnl3UJeTC

On Thu, Jun 27, 2024 at 01:34:25AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_probe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index e1099d75..0b53121a 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -838,7 +838,7 @@ dt_probe_lookup(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		 * To avoid checking multiple times whether an element in the
>  		 * probe specification is a glob pattern, we (ab)use the
>  		 * desc->id value (unused at this point) to store this
> -		 * information a a bitmap.
> +		 * information as a bitmap.
>  		 */
>  		desc = *pdp;
>  		desc.id = (p_is_glob << 3) | (m_is_glob << 2) |
> -- 
> 2.18.4
> 
