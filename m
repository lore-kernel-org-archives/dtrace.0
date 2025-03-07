Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBF1AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383314; cv=fail; b=YSe0Ju6f2DI5Dxzveh1CI1kWffu5GEQN7b4E4JIl2iboGAj3Y0CNVhhC3K3sxvhJKtfxnENgOy+msjb41wX80CKzatWIVJEqqn2J0huhbA80uP85q/TjZhTLRlZGpIBwKytQTej3hANaAemYHuYMjepV6AhW+N/V34TJibqRi00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383314; c=relaxed/simple;
	bh=E0BnwP2MGd2aQa3cUHQsuCjzZd+Eva8DEPg7Df8x0ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=My8MuW7n3k/hcDLFgcsZ9O6E9kOX7rP8iKqYGbWpvHK5rDurfXf56gp2cCVQbXQK95wFL1ukixCdtTd9t2jyZP/QH2m/fR8JdEjDiCpir5XgsOTr/cvP3eTC65tgCZLtuHzncidqpx6KS7Eb/2yuCBmNLSXAHEqVpw6eu+NB/zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QrtJZ/4q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RomUcK7d; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QrtJZ/4q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RomUcK7d"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIOx9014688
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=xisS5TsClIfeYPQ67O0WLfiwZcNb1HvI4/YQsTxIzvw=; b=
	QrtJZ/4qRo6jzseTpsycYUbrR7WJAr1M1c72I+pUrz12KmsC8cXfuqm6qZd80Pqi
	tyR4/uTxryyI1r47GyHX4B6iWBIUvQGXJAt2EL9MT7fyB6MDcdQtTVeGjFWrguF0
	Q8k3DwIe8w+0gsQ2kIdtMaYbvDYJZYIVlBsuZiqLabMfxm05bHhlzwJH+7mzOSqC
	LE34sQ3iaF0sIpNq1VKgiyhBqCNvQZ7JlyYljWIq5DvNE1Oib/D1xdB962NwoX5S
	6otUdmyRTFxmVB3wboh+vw6QRTa36019QdkC6JKkXews7+LGFmZR9zf1D42EVcvu
	ltzgFde7BP3Q/eDWxGa7Eg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u8257ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527Kg5OM015691
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpf4h0v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Boi8lRiveFitzWxmLlSVkEITDrl6QwMLGTqr6ouaAYEMN6w/6BAoyEo1qevzjKm53SIkjy3XVZnWJwPoKh/wYVlKp9JqAQXDG0xMKhXUNCLw2AyXC4Q1FDFqFRx4JN4c7xTyG8vtE+fkTnfccfQ8Lgb82QYoxhPYbMR2gCZ6qQirra0BdsGvph/kLQeR8+cogZcWZbJdIjg0Y54f099hMg2TF2Vyg2FYeUDY0tWS7DM1tq23OINoEshhkAnKBvjFiMaWExS7Cu7iN5BSdUGjdwLyJhE+73BSUr0dG5+AncrTdck/Ljzp98/RG2Gx7V4qg1Y4CeaZTnhX1uAZ0csSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xisS5TsClIfeYPQ67O0WLfiwZcNb1HvI4/YQsTxIzvw=;
 b=OraGYY7DUmws5YXEnC4sPJePjLeEjdz38wYCUc8PVwzN2pVajBV86w8eQNE9my13vsCeH+yduvxyk1Qqiz6bvYJ1qWGxcWnZM2k0SRZkJUPt8FkNFFviTSfW0xBUK3uhUmEasFBVmqNg0AODMiOiwsu1VKyNwpQ4dWgk7SIJzDnwkkklMatHZp8306101SgdluzUKexEKg93Vq8Q2aAhWEPvC4xr7remfL7h840HxTJBA4YZ23VGcL6wdAkQ+ikB6KwgUWkuStU8cuu394mRzLY+oyykF0MmgjpVnUDY1mX0yLM49Y8u2tr7hgbYEJNcMVKUf0FJ7v+hRv8OeYBIuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xisS5TsClIfeYPQ67O0WLfiwZcNb1HvI4/YQsTxIzvw=;
 b=RomUcK7dkwReOk61pDIt86naA+vd9yf3J+PBf58puiI6PZo2n3y93208TBoVegFC5qUaQ2gbJCVwL1gRCnRMc6+qaCB7BVn8Wb5p4VqoOtPoSgSABpZMFSqupUzn4/ozl+b5swa7XgdD3L+bsA/DOUsEu84QZbhQ5mZkejIQoGI=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:35:08 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:35:08 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 6/8] fbt: performance improvements
Date: Fri,  7 Mar 2025 16:34:39 -0500
Message-ID: <20250307213441.9495-5-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: cb364072-5210-457a-3000-08dd5dbfeec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?86UZbRm0NwDothVMFIiTPfWs13JquU2MLsSLBlUjuxcw4oZfR/TiCRCLGpgP?=
 =?us-ascii?Q?j0ghXgIxJMDJfQo+ssqgXpHBmUxogaAdiB75OgmottACEZAg/RV6naCu98Pz?=
 =?us-ascii?Q?/9Smm4mYHZlNXLQmjgWw1cAoDQbqIWMS46QUUKbSe8849NXVT+Zoko4sWai2?=
 =?us-ascii?Q?CPBAcUlu3/P5Prx2dCaudA755s/ZqbPgABpKocaUM/Dk9fzlM7Ki8vUynQxq?=
 =?us-ascii?Q?Z1pDtAfBu+9QnkRaT585LWSxodf3XEKHkUI8UAAGK+Lansl3hvQbfaVLzN54?=
 =?us-ascii?Q?u6ydQS1ZHqUFlQU53ijk3iXlO3CwP6OUQqnVAjH3GdjRg31zdFJpIIK15TXF?=
 =?us-ascii?Q?JoKePN54lkXzcy5wiDC/VYbgoGbAsBCSZyyhM09a2zJmmspKfCC2YGu3W+xp?=
 =?us-ascii?Q?+YljR5Cl/JF75G3MX5OfZqhxqK5YXzrexTuFS+xBZqLvPNM7uuk4aFeEThjG?=
 =?us-ascii?Q?nuUCBbIMznwG7PXrMY6d9lmNTt7l4btRV11p7JvA/sHn6Xdp3yGj4QU+e2FG?=
 =?us-ascii?Q?3ooQ68OXfOHkxJ5wXJ3VmBOq6hCeN5UkN686P5pUhE5FgvnM5DPhPdpUKwza?=
 =?us-ascii?Q?wWfvERLMsjDPNVyWQ8/91gD+iefHqdEdl1VRMFo81SK97zUAvbnwa51BwGTt?=
 =?us-ascii?Q?crIoygfjWSOcVEIa29AvhNA9wYu2a7M2QYnol0okqetVzQxNxelWuXMWLqmr?=
 =?us-ascii?Q?0IRE9iMDf+8rPtx9lYuZjbK/gJ+rm33gRzydGmqsMI/4ZWRq3L4h9Ch1kEwG?=
 =?us-ascii?Q?YBZ7LYxBMC7jiVRGv2pLhoBmnE6ztDDcBScLKYLWdFl4I3jElk1ZDi7OHKC6?=
 =?us-ascii?Q?OFJJy755mg8M2U9hZ02yBDEUAOGTKrOmuC+s3OwMSdmfrwsoejEHlEkzJgfa?=
 =?us-ascii?Q?9PRdxVqIm3uosVC7MetLrG5vXmDmrCS8gfFVStoFitd2Ui45Ho7araa9CUGe?=
 =?us-ascii?Q?10AY3YsTmxhtLj+p10VOdi4xCEA6urtL3jh4dMJE1ifrel6O5hgZTGRuiFVw?=
 =?us-ascii?Q?t/qb35uv5idIv0oM1vNpYxSk65nWPpP09bhQ89i1mkwVGSMP2Uuw58w+Vbtw?=
 =?us-ascii?Q?Z80SWdNJcDZzgevb3tyUKGqDnpkwjY6gqyllaUziEHnkiUr6leuRASBBjvl5?=
 =?us-ascii?Q?/cqh7r97QzVwghjhK5GSnUxfEZ/626RjccQsFKvdGs1reKs0qCP1/VtbzDnR?=
 =?us-ascii?Q?v4Y/Of1vzabX7kqIBYVTx0dMNituoygCGv+u3rtF28RNLvoGxuxM2clVO1bP?=
 =?us-ascii?Q?KUK0kTtpRiZ3lcl7swPkOkdKJzu7GMpAcWrgeqgSMFT8R3qHkMZH1xLDlKth?=
 =?us-ascii?Q?wpQUK0EjIsyjD5l76ZI0TQs1KiMAjzT1j4R43Dm9FQPKwtMD+gICEkqvGT4Q?=
 =?us-ascii?Q?WnSisYrjWbXSryx+OfHte6Qs5PDy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kESZdIiuq0BqrZA6jD5zd5XNZGmYeD0bc4nUJiX4QI2stFZzdNQ9MmANty5R?=
 =?us-ascii?Q?tNjcT+udWUQF9AXZmjSJ2eTmUqMXH4ZVhGVo8Qoo+Euu58nh2lIRMStjpHdm?=
 =?us-ascii?Q?y9DlmqpSmPQy4I7KxYE1nfZxrwWZFBCbuw8Os3chIHC1iudjMFKVHAxifBm/?=
 =?us-ascii?Q?qVuVIRerDM1P5B4be3xFkU6vOJKnzu/Wg+mzlnvIyx5jkxyPbJpCn84bT8Vb?=
 =?us-ascii?Q?4+/+WzQCXFCcytMPMq5R7zBbSB79zqLc/jtpabcQiF3r84kl9BvQe6YDrVVO?=
 =?us-ascii?Q?2pxCbr4hoAd5OfTyXO3+2Mqtwsdm3I4Js8mzAPtfJV3nLKyAR6uD03PjPlyc?=
 =?us-ascii?Q?muuUBI94XZgMijoBKehKeUN6Ocd2pMubbR4DoFRSNi+PJ0OhgDXcsrPHyU/C?=
 =?us-ascii?Q?qCfrJXqW0mKDIiclGYiFGs4vfvUTkTzYEaFJlsZg3tT6XzKpcs6M2Ve7+68h?=
 =?us-ascii?Q?9qW71B+FQ8NctxOTQb86/rT4U6IavmaGHGs3bVooXF20s6QwRFNwwNpT4EUs?=
 =?us-ascii?Q?qc+SxWfQKMsxA7aS8wKRlPlaitUe517j7g7kBc7k+63zglyC/JjdFXBFogHM?=
 =?us-ascii?Q?TtaWsq5R5/R1HbvCafIwFyq993/CYd8COnl8kPQEzumSs4zTuFnkZ62/kvz8?=
 =?us-ascii?Q?PH2+qgXERNX4OM6JkRroHgEzgfMiWAvQdAuzLUf1eTXzi585dN8NmZCrnogw?=
 =?us-ascii?Q?0MVtAKTzDDWnJPVgWGa4EgstDiFAMDKZeuDbxqyZpnxHnB93lz6k0MvVCPI7?=
 =?us-ascii?Q?plweVDsc0WzdUgGAz9QkWsOB02sdkcwmKFrOanVjzNzvM/3kMqz2WBk/0I47?=
 =?us-ascii?Q?Gmu8zBt6UMskXIxtB/Ltpoz9HU5uUU87yvn4NfL4b9EUMuGaS+wsNwRehoiA?=
 =?us-ascii?Q?3Z11OCKRAJ9xs7Joqq9trPmHwSKIGUw9NwuXMqt4LxluegVc8IGTLezjtGKM?=
 =?us-ascii?Q?NmnPfJy+8D8/bC5aTGv5KmJYsQs57L6/TAGwq8BB7NmeFb8eMdLjExosljDA?=
 =?us-ascii?Q?bJXFxuMlUeFa6PM1USwnuSr+5ddiBg0oJnanul8lW5QHKH8VqFcx1qarRBe0?=
 =?us-ascii?Q?fAGR5gHqKV9NMHjxFdbTpiHVaUZ+A7fmG3bO3bK/+vzeUYuI1POkWKsaM/SM?=
 =?us-ascii?Q?/cPaE9g6rBNIyecwyxCX2PHPPiOoQnix99JITXQBXVuhuFGGwJe/Lv0hs+nN?=
 =?us-ascii?Q?RgVRkfBPfGwpFLt/qislfjfanRgdcFT5xzRdaEOlgHC6UDfCOANcmZvParkV?=
 =?us-ascii?Q?6cTcydCT2kx4x23gWmSK+pWWCTq7ZIfjSpmL8vEkyNFzpQufD9H87BSFQsRf?=
 =?us-ascii?Q?h0FkgUVT9m/Bd1cpMhey0Jya5gLK3B4zSNwbKb1kKGJ4iwC7ssLjmALqt3rt?=
 =?us-ascii?Q?YOCM6QPLA7xf9kbFwe6u1ESUwi6O4ThnSzo6eU/d37nm/y4Pq9bHE70wbGSh?=
 =?us-ascii?Q?MH+Thim0Hfhqvi+QGn4VA2rRcPZJuazxbvfFXFNA2E2/zlGLcggiMh6Zxale?=
 =?us-ascii?Q?+ZwD4dhH5beRu7WFWk3QN25TnqhoJL4nV9mm2xNNaKhbwijlxnJ/yC+07OHL?=
 =?us-ascii?Q?nSdIeMkW8UCQBhH9QL/WxEBJlRoCu6p2m/YzYt7QcO6PAUwHhXtaQX70csCo?=
 =?us-ascii?Q?fpnv4dRkcE8BAYe9/hHm7yU=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CuasnfiJe2MByXr6xGxSzcaZfgeh7U3+O49b1ciRWKn2xxZKj+bbEtn3gYWQgWxgWh+xiHTuuMRN2u5EtZETGW/nO8Mghwv8iRFUaB6H7IQgMT1xC1RVv81uQNaSNOOWpkopW/FZISVnTF2AA8z0/0iPN5O0GRKpYJUr7xGpHU6DSj3OS12S8rEqFNrDySjeRPxcLcHr+TTcUlsVnnK6EM81sWyPYI3gMnVX4ZvxwSZs1UkRg5LFGXDhbZy4XtjtWOjnK/I546dA6Syri+cCsd5AM/X6tA4ITLaSjNMNFHOY7BJqkQI9lMY6fqpSjRXlBv/KU2irTIMCzIyMnIoI2AKmIEuHdYyPHDMJptJ6GAImz9j7L8urAqyMgDKsuMvV3VG1sSyF/vzCEEZBcgnT4DneE6TgnUaOvbCh0tITCmJOWysaNPPA1hlAvSLnM+gKaciEnJYpDEo9CKs0btG2T5EHyoC310ZfnXrp3kiTdaIEnni5ZuTgBnk0TBKDkpZg5tFGKPYkM0srPd2lGDYg87QvpbCvENQ/zOpYwiNKIAFivQBnfJxZBdEy0mfSbRz99x5KMdgz6C0K3U4/Pr9xMWBPCpXNGcpVjbDxF4n48RA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb364072-5210-457a-3000-08dd5dbfeec6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:35:08.3770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kf00UmtdDKr8e8fP1v8ZLQJZ29tcGFhkYkDpTTpj0XANrCOUIwI2FAT2HQMMs2V2Su8sGwlAqwI+4wGmQsEn8l6eTUWDU5JlJZvuS0sNRjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-GUID: X0jagilVteaBAUHNjnSS4u41J1PglvNY
X-Proofpoint-ORIG-GUID: X0jagilVteaBAUHNjnSS4u41J1PglvNY

Up until now, FBT probes were registered for every symbol that was
listed as traceable.  Most tracing session do not use most or even
any of these, and the process of registering them all was quite
slow.

Going forward, FBT probes are registered on demand.

If any FBT probes are to be registered, the first will incur the
cost of reading the entire list of traceable symbols.  Any further
FBT probe registration will be able to be satisfied based on that
initial processing.  The performance improvement is therefore quite
significant for tracing sessions that do not trigger any FBT probe
registration, and if FBT probes are used, the improvement is still
quite noticable because only the probes that are actually needed
get registered.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c   |  78 +++++++++++++++
 libdtrace/dt_module.h   |   2 +
 libdtrace/dt_prov_fbt.c | 217 +++++++++++++++++++++++++++-------------
 3 files changed, 228 insertions(+), 69 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 2e915e2f..e7553a07 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -22,6 +22,7 @@
 #include <port.h>
 
 #include <zlib.h>
+#include <tracefs.h>
 
 #include <dt_kernel_module.h>
 #include <dt_module.h>
@@ -1044,6 +1045,83 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	}
 }
 
+#define PROBE_LIST		TRACEFS "available_filter_functions"
+
+/*
+ * Determine which kernel functions are traceable and mark them.
+ */
+void
+dt_modsym_mark_traceable(dtrace_hdl_t *dtp)
+{
+	FILE			*f;
+	char			*buf = NULL;
+	size_t			len = 0;
+
+	if (dt_symtab_traceable(dtp->dt_exec->dm_kernsyms))
+		return;
+
+	f = fopen(PROBE_LIST, "r");
+	if (f == NULL)
+		return;
+
+	while (getline(&buf, &len, f) >= 0) {
+		char			*p;
+		dt_symbol_t		*sym = NULL;
+
+		/*
+		 * Here buf is either "funcname\n" or "funcname [modname]\n".
+		 * The last line may not have a linefeed.
+		 */
+		p = strchr(buf, '\n');
+		if (p) {
+			*p = '\0';
+			if (p > buf && *(--p) == ']')
+				*p = '\0';
+		}
+
+		/*
+		 * Now buf is either "funcname" or "funcname [modname".  If
+		 * there is no module name provided, we will use the default.
+		 */
+		p = strchr(buf, ' ');
+		if (p) {
+			*p++ = '\0';
+			if (*p == '[')
+				p++;
+		}
+
+#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
+		/* Weed out __ftrace_invalid_address___* entries. */
+		if (strstarts(buf, "__ftrace_invalid_address__") ||
+		    strstarts(buf, "__probestub_") ||
+		    strstarts(buf, "__traceiter_"))
+			continue;
+#undef strstarts
+
+		/*
+		 * If we have a module name, look for the symbol in that
+		 * module.
+		 * If not, perform a general symbol lookup to find its first
+		 * instance.
+		 */
+		if (p) {
+			dt_module_t	*dmp = dt_module_lookup_by_name(dtp, p);
+
+			if (dmp)
+				sym = dt_module_symbol_by_name(dtp, dmp, buf);
+		} else
+			sym = dt_symbol_by_name(dtp, buf);
+
+		if (sym)
+			dt_symbol_set_traceable(sym);
+	}
+
+	free(buf);
+	fclose(f);
+
+	dt_symtab_set_traceable(dtp->dt_exec->dm_kernsyms);
+}
+
 /*
  * Symbol data can be collected in three ways:
  *  - kallmodsyms
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index 56df17a6..dd3ad17c 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -25,6 +25,8 @@ extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
 
 extern const char *dt_module_modelname(dt_module_t *);
 
+extern void dt_modsym_mark_traceable(dtrace_hdl_t *);
+
 #ifdef	__cplusplus
 }
 #endif
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index eef93879..d837e14d 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -41,10 +41,8 @@
 #include "dt_pt_regs.h"
 
 static const char		prvname[] = "fbt";
-static const char		modname[] = "vmlinux";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -61,19 +59,11 @@ dt_provimpl_t			dt_fbt_fprobe;
 dt_provimpl_t			dt_fbt_kprobe;
 
 /*
- * Scan the PROBE_LIST file and add entry and return probes for every function
- * that is listed.
+ * Create the fbt provider.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	FILE			*f;
-	char			*buf = NULL;
-	char			*p;
-	const char		*mod = modname;
-	size_t			n;
-	dtrace_syminfo_t	sip;
-	dtrace_probedesc_t	pd;
 
 	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
 
@@ -81,79 +71,166 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
-	if (f == NULL)
+	return 0;
+}
+
+/* Create a probe (if it does not exist yet). */
+static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
+
+	if (prv == NULL)
+		return 0;
+	if (dt_probe_lookup(dtp, pdp) != NULL)
 		return 0;
+	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
+		return 1;
 
-	while (getline(&buf, &n, f) >= 0) {
-		/*
-		 * Here buf is either "funcname\n" or "funcname [modname]\n".
-		 * The last line may not have a linefeed.
-		 */
-		p = strchr(buf, '\n');
-		if (p) {
-			*p = '\0';
-			if (p > buf && *(--p) == ']')
-				*p = '\0';
+	return 0;
+}
+
+/*
+ * Try to provide probes for the given probe description.  The caller ensures
+ * that the provider name in probe desxcription (if any) is a match for this
+ * provider.  When this is called, we already know that this provider matches
+ * the provider component of the probe specification.
+ */
+#define FBT_ENTRY	1
+#define FBT_RETURN	2
+
+static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	int			n = 0;
+	int			prb = 0;
+	dt_module_t		*dmp = NULL;
+	dt_symbol_t		*sym = NULL;
+	dt_htab_next_t		*it = NULL;
+	dtrace_probedesc_t	pd;
+
+	dt_modsym_mark_traceable(dtp);
+
+	/*
+	 * Nothing to do if a probe name is specified and cannot match 'entry'
+	 * or 'return'.
+	 */
+	if (dt_gmatch("entry", pdp->prb))
+		prb |= FBT_ENTRY;
+	if (dt_gmatch("return", pdp->prb))
+		prb |= FBT_RETURN;
+	if (prb == 0)
+		return 0;
+
+	/* Synthetic function names are not supported for FBT. */
+	if (strchr(pdp->fun, '.'))
+		return 0;
+
+	/*
+	 * If we have an explicit module name, check it.  If not found, we can
+	 * ignore this request.
+	 */
+	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
+		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
+		if (dmp == NULL)
+			return 0;
+	}
+
+	/*
+	 * If we have an explicit function name, we start with a basic symbol
+	 * name lookup.
+	 */
+	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
+		/* If we have a module, use it. */
+		if (dmp != NULL) {
+			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
+			if (sym == NULL)
+				return 0;
+			if (!dt_symbol_traceable(sym))
+				return 0;
+
+			pd.id = DTRACE_IDNONE;
+			pd.prv = pdp->prv;
+			pd.mod = dmp->dm_name;
+			pd.fun = pdp->fun;
+
+			if (prb & FBT_ENTRY) {
+				pd.prb = "entry";
+				n += provide_probe(dtp, &pd);
+			}
+			if (prb & FBT_RETURN) {
+				pd.prb = "return";
+				n += provide_probe(dtp, &pd);
+			}
+
+			return n;
 		}
 
-		/*
-		 * Now buf is either "funcname" or "funcname [modname".  If
-		 * there is no module name provided, we will use the default.
-		 */
-		p = strchr(buf, ' ');
-		if (p) {
-			*p++ = '\0';
-			if (*p == '[')
-				p++;
+		sym = dt_symbol_by_name(dtp, pdp->fun);
+		while (sym != NULL) {
+			const char	*mod = dt_symbol_module(sym)->dm_name;
+
+			if (dt_symbol_traceable(sym) &&
+			    dt_gmatch(mod, pdp->mod)) {
+				pd.id = DTRACE_IDNONE;
+				pd.prv = pdp->prv;
+				pd.mod = mod;
+				pd.fun = pdp->fun;
+
+				if (prb & FBT_ENTRY) {
+					pd.prb = "entry";
+					n += provide_probe(dtp, &pd);
+				}
+				if (prb & FBT_RETURN) {
+					pd.prb = "return";
+					n += provide_probe(dtp, &pd);
+				}
+
+			}
+			sym = dt_symbol_by_name_next(sym);
 		}
 
-		/* Weed out synthetic symbol names (that are invalid). */
-		if (strchr(buf, '.') != NULL)
+		return n;
+	}
+
+	/*
+	 * No explicit function name.  We need to go through all possible
+	 * symbol names and see if they match.
+	 */
+	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
+		dt_module_t	*smp;
+		const char	*fun;
+
+		/* Ensure the symbol can be traced. */
+		if (!dt_symbol_traceable(sym))
 			continue;
 
-#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
-		/* Weed out __ftrace_invalid_address___* entries. */
-		if (strstarts(buf, "__ftrace_invalid_address__") ||
-		    strstarts(buf, "__probestub_") ||
-		    strstarts(buf, "__traceiter_"))
+		/* Match the function name. */
+		fun = dt_symbol_name(sym);
+		if (!dt_gmatch(fun, pdp->fun))
 			continue;
-#undef strstarts
 
-		/*
-		 * If we did not see a module name, perform a symbol lookup to
-		 * try to determine the module name.
-		 */
-		if (!p) {
-			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
-						  NULL, &sip) == 0)
-				mod = sip.object;
-		} else
-			mod = p;
+		/* Validate the module name. */
+		smp = dt_symbol_module(sym);
+		if (dmp) {
+			if (smp != dmp)
+				continue;
+		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
+			continue;
 
-		/*
-		 * Due to the lack of module names in
-		 * TRACEFS/available_filter_functions, there are some duplicate
-		 * function names.  We need to make sure that we do not create
-		 * duplicate probes for these.
-		 */
 		pd.id = DTRACE_IDNONE;
-		pd.prv = prvname;
-		pd.mod = mod;
-		pd.fun = buf;
-		pd.prb = "entry";
-		if (dt_probe_lookup(dtp, &pd) != NULL)
-			continue;
+		pd.prv = pdp->prv;
+		pd.mod = smp->dm_name;
+		pd.fun = fun;
 
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
-			n++;
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
-			n++;
+		if (prb & FBT_ENTRY) {
+			pd.prb = "entry";
+			n += provide_probe(dtp, &pd);
+		}
+		if (prb & FBT_RETURN) {
+			pd.prb = "return";
+			n += provide_probe(dtp, &pd);
+		}
 	}
 
-	free(buf);
-	fclose(f);
-
 	return n;
 }
 
@@ -447,6 +524,7 @@ dt_provimpl_t	dt_fbt_fprobe = {
 	.prog_type	= BPF_PROG_TYPE_TRACING,
 	.stack_skip	= 4,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &fprobe_prog_load,
 	.trampoline	= &fprobe_trampoline,
 	.attach		= &dt_tp_probe_attach_raw,
@@ -459,6 +537,7 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_KPROBE,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &kprobe_trampoline,
 	.attach		= &kprobe_attach,
-- 
2.45.2

