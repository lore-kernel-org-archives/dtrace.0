Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BF023A6
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276915; cv=fail; b=OjQrzLV9I4F0XiVvr2VQPrOEWqIDUXb75Ldy9nyWitvZH9LmnnPEMv/YEja/Dj+6nCzyIorLLXqh20BUxoEsV7zgBydOCUNQ+99DeCt+V/BvZxH1CjK/H2rTIL37VwWYw1mYTsY2Cwguc4PpnbmVv8Jqx+Bn8apTVI+47KwVOk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276915; c=relaxed/simple;
	bh=RtQL5RjTSRWRctPogz1qHkXMMfJ3ciE/AE3sDC5f6qE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=s1AGkg5hCdyqtu0VLYO8U7KB3tr2or8QYKGcjamxGsfENNmsnZsHZ+739Qi5H9IbuKEsYTYnzidqfnQjpBoOP9TdiVuNeUX0OIqLaPKcrRjMqpbro1vIVPgZh2A8Myz2UwKFCJ/HKLEuJT7XnVb4fuDvAv0tz1wiSL3SV2/PYs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AOPd9//e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hUoYp4Ye; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AOPd9//e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hUoYp4Ye"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5574vrlf016868
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=U81trxFVNionpPb0mslyYKyIrO1xsYfi+af51pyj+Ok=; b=
	AOPd9//ejnRSNPx8avPKh5k8bYex2xfqA2UKP09NoZidC0Fx5lRoi44Ap5ILG9v2
	jE5sncnxxIQp59eP06jRJqM3D2O0b3dHeOknpq1bctc/wQBfOCfBguxwGf1t1aDv
	9o8oAt/XEdKtGqnoqec7dCRywfd5J0mHL/7WTrOyLEnVamYg1QydelCQfRQP/RiQ
	96QrSLkfLy2qjuGaqk1IGVg+JDSOQvDwji6Y4VNFskx6sb224DqyDWaX8aakIBzu
	dpoEJWriHzZdE2XU8EN4ptiZuzV7VKbgL6h+zalcnUvCo9ea9rMD4BUAUxI2TP4P
	LqdGP+RMLG6QaR4rXIhvEw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe831g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XYgc020720
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:11 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kysw-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oz28Yi/LP33VPcjo94RMWBi9Yu5zfDLDbCP+0ZXnEvxBRBs5ms/AXt61w2Y4L8rW4jprqY4ihdcu1XCfsUeVqsicin1rs6Mt3hYhyytsAfR8rWt2iKPGrT1kvpe4Hgu7UuR5FdRzNUmC4/jzhogTogVJuVF650yhBrLKEFxPSh1kjrCgvCAt+lzJLFEYUHDohUP1JV6C7LFqzmvESGiAOsXGkx1s2zUsDfHs8d/Dugh47LdP6CcdfjMI4pNA4H4ScNuK21m7FBoGqg7NoIaJ4AyM2k72P1JRrSXyFGfsRhwC3PioqnN5hHYRPJV8afoNk4lnw9GwCZTfFfleXJfU1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U81trxFVNionpPb0mslyYKyIrO1xsYfi+af51pyj+Ok=;
 b=F7OyhBrcuHUN7c3itEmT+dlvnSIT5JjiCbaC9NtUsQifH2lY2iYWDBL2mlRUl6FsGwB7ej13lQHQdnfL/0AH4JVlR5s1IRCLFplW9WNhafOfT17dOyEKLjymWy79TWMhGFc2rO723VlXWUxa2NaO6yBeMhxsESi0DJGRcr/X/dzNEoKrrsZt00QOzozzw06ZoiSu5if6f2TGtYjcwEPIWc0qD7DXtc5ghz0flLcOEe8EQdCpuJTekieyFeCneqdS5hME3NufiHAXXhV3umgW1hZ8nX/RpyfyKrip+SwIxKG6I4FgHxrIYtU9qovkebuCEEtxHkmmhO2TFu+tiEtYsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U81trxFVNionpPb0mslyYKyIrO1xsYfi+af51pyj+Ok=;
 b=hUoYp4YeCgRLGBEwkqhKeF8FLgK9IqoEl0vN7LSbRXOrt6WiIS3r7QAgASr9kFcTBBjeREcPNIVbvOBWgyRx5lj9ZuLo7Zcj2xmMWTJ0WtENU1KKhkQLpOrAOKN4iqh8I1kwBeW3tQX8p1xy6+TQp2HdZUie9EGb8DCUGTEC42Y=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:09 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:08 +0000
Date: Sat, 07 Jun 2025 02:15:07 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 17/17] test: Adapt USDT PC search for USDT LTO changes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374813117D19D477A899477C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbf9120-2261-414c-e02b-08dda58aa701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yAjCkZqOt30QfEX0Nfqwgrotfh50P4ExCNi2AlWBGQvdcfrXJH1D2EWZTqG7?=
 =?us-ascii?Q?Q6vVjWsnwH+T7Xr7xVhWXo9J7Sfsw4GKw1uoGyH2ZetxFEYUhh5JYkAeVnXv?=
 =?us-ascii?Q?jkVFnpmf4CXT1HnYdDgeDFG2BLgnRv3p11AqrLfGAO0+63fS7x6vSk8AhYcl?=
 =?us-ascii?Q?EDciDyEiApv+eRZMv7xHy2oaIDkQncqeHR8IL85yHgUyDYmFSeh322qmYUfK?=
 =?us-ascii?Q?bSksISf83ePRe2nSwdr8eRpUaVjtHMDq64iKCSf8mhmJt0/azEqrB2zM4NFb?=
 =?us-ascii?Q?7nKLPf46gfQJuLGxu/MQXsnwsWVC8RDXZin2eVxrb1PTX0Es2suOrSoSyB61?=
 =?us-ascii?Q?7qjRdfgjeQ+USYHSq5oWnf3RcN4o6eB53Tc1vnuS5dctyo0rcvw+FnycK0nz?=
 =?us-ascii?Q?g2JIRb4WFOrhGb5Ha4oN4wGN6usDmQstcQgODmSHQfL7aWN0PGEsie3S5UQS?=
 =?us-ascii?Q?qSOXkTB0lEr5GHbfXVdB0yoM+t4mQ8UQp5JeyGUNKCIQK6g4LBs2bvjIrZy9?=
 =?us-ascii?Q?WXy4DTRShXXmtQQQ5mjNhxQ9cN4JriSMRIH0nGTfvvh3ORJlC6SH5NTj3jyq?=
 =?us-ascii?Q?V4OeiWuh1EwypTc22KUcGi5w4V4acTNpO/B6MY+33b4aNlpd9/B73xtJtQHH?=
 =?us-ascii?Q?Rhp+5LjsWvyaE0oCQR6gJXmSZ31NKSpbIFpaboL3OowZsTSvsHAwSkOto2c1?=
 =?us-ascii?Q?pgC6gm51hZ5fCaeucbWC55CryaAtmmWtup+EXH/4SZcfJbDQsk5j9iaQMmS8?=
 =?us-ascii?Q?yy+KzE477MeE0/R6MDQ6UnK3+NUaqkirXscXgeylsO0Biq1ApdrSpTan2mvk?=
 =?us-ascii?Q?Cef91hyI1RYBZ91+eMcD2v88hYQ69V92r2pL71iwE15zPl4bPk+2+cSpDZD0?=
 =?us-ascii?Q?+jTeqfPSEUtTkC6mLzTa94uR1OdWLl0BMM6q4bpIWXrM5lHGqGtdJGpqExbz?=
 =?us-ascii?Q?GRieEuPzRGE5sIpfiXOXa/Fmd54nqp5G6pj/mpT7PXbAyhXLyqj86tXOdE1A?=
 =?us-ascii?Q?nOhc4jEm9UWnuBBbQVQJRvSQtEEAWocpnGON6VgY1QTv6yjT8T3O5HH8i+n/?=
 =?us-ascii?Q?phL/55KHDDNLA8HkWinOpXLIWUrsi5uMp0Yulv1Yk4vC64wLkq1fhP2UYSD4?=
 =?us-ascii?Q?i/nOdDu1P+ewhMHcC+ainSSlC0/SPxma4v0Mi12mrQbaGQaOQ4BvEI/CeoVl?=
 =?us-ascii?Q?05txsNAII0rY1cmjN/Pn/wcfZPtGyuCsCetNt9NfQ7Uf5acOjrH/h9DHLVN1?=
 =?us-ascii?Q?ZUFUE1EMK6jsA+t+HF+U9LcLlNpw0QJFf4bF/p70I9LJoaWA6Dp5u+6U98Py?=
 =?us-ascii?Q?7N2YpAEesh4TSzr52m6pebUSzZtIaxeXDN/FLy338mFbh8XCmedKZmaSmLoE?=
 =?us-ascii?Q?kjcoAPTuBJf9H1FmI2aUUwchmujadYFKC9VJgy5SlouE6g7K4LnAFyphsaOT?=
 =?us-ascii?Q?ruCLeL6GXko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHjYuPtone4rEVTvSpht6ah9RfSEWzfuKHnQdeSop6apg7ldvW0RVfVQn13U?=
 =?us-ascii?Q?DzVlNJ25XAT5eUs7Z5UarJLOjL6Ak2evvvnmN+is2hzRPEFvaZkUFS2DGtSP?=
 =?us-ascii?Q?C5BTLKoVO62WZpuy+0DedXybN4URgRXd7jgJcDtIKpx9BA5AEAmnl2ln3GWb?=
 =?us-ascii?Q?WJAhseer23Qxat+K819O+6PpSIHk4P3x8pbkp3WDq64YW5aT+PyVZYOOq4Jz?=
 =?us-ascii?Q?XXNqkyRbHP6nBoqPkC0I7M6DyDZmYhYjUKycuyGM4cGBbQ+iYfpseQKBxwCR?=
 =?us-ascii?Q?C7/9AkKHrYSAZFffyJkFCXpNrWxbQOmiAgkFhV6JTTuL120pdgdL9iejTEMo?=
 =?us-ascii?Q?9Z5IXJoPGf7lAfGKeUgsUvmvYdbdUim2FSKJa6jtIYSrgiVLeo7MyX1jGgk1?=
 =?us-ascii?Q?sMZM54Nfht2Tk6kHWarH5MmJIDKWRggGfCOoNHLbrySwAUD/Gv/irhw2Dr1w?=
 =?us-ascii?Q?IptgP3uS9bUvey8ykdep8UV0/6M2oQglBgjblKpp5c6x1Fn5f0HIrXKszuiZ?=
 =?us-ascii?Q?mvd8Wr/H+24RFRPUNcbd2FvCCpONFdfymHgCVyL9nQU0lWmETsXoMyyQCALn?=
 =?us-ascii?Q?nghgCN4xcVx4Ydwy3PavZdeC6vSMxAfnx2pn1f2l6MaLSFJyraeomKZCoMEl?=
 =?us-ascii?Q?MPDw1JNO/tK+dgUeejhjBNh9YboEmF4SbQQgBCUoFgFmtWo0Czyk3ZxIuxUU?=
 =?us-ascii?Q?iSGIkDQKUIk0j9cDsYpMBDMHJPs6HPWR1pIWBNZHJwaGJYTLCxa6+018tyQp?=
 =?us-ascii?Q?PIW6wIrbNutGqN663dBmtnKDADSbfZ8maqLx41pYiClUJRuaa8xen+HUSrRp?=
 =?us-ascii?Q?iYnm4ZKwCBHfagtmPcc7nE5VxR4f43oud1VXbjqNbTOCaC8zOBBLECml+H3i?=
 =?us-ascii?Q?ihOens93MD99qlDhAMjmh3tX+kCDFEb9ebwUGnLeDJxZAPFnG73W+2FrMVEI?=
 =?us-ascii?Q?TFWMtsot/44MdhHDrOThl6qcQv+cfuzyXy9FRJ1oWLK2W5jnC1WPDmadhtgo?=
 =?us-ascii?Q?+e3HLObzocno3t6/vhTgKzTVdpSiGk5MbphjjntvWLvqx53IC/cdHQ0Sjws4?=
 =?us-ascii?Q?HpHZaEdfCP3zyE2ZGHR+xI0lS0Zv+/Te9XLaVRcT85L9SWH669aMuClgDL15?=
 =?us-ascii?Q?MEYBaErHzmWDRMo+9Pd3dzHzwdn7sf5mwEVO2UN6bi6TnoHhPN8VcnYUCcBF?=
 =?us-ascii?Q?D0VCZCZepQhurIoaFTNXUKGMToBGLyE9A3uV2wABQlvL7r+S5cJYAgIWJefB?=
 =?us-ascii?Q?FhWLNAr32WvA4LK6T6Yv/tJHaSc5McSkqXTiYv2vZiWCO3g5f42hVLmTtFCZ?=
 =?us-ascii?Q?S5gm/N3m5hCzN1NaNy53X1pWFuRAjRxH8mXHmUdsPkjmPMjPCL/UKwpT7EtA?=
 =?us-ascii?Q?+LJRCci+e2DC3Wquf9Uq6Uvgyysarurfk5uPllL1pR540hvg23cyt7wjY7YC?=
 =?us-ascii?Q?Lp8Lx8QvphPTQDUmv9SUt2rPOPE15pzuny5zmqwy5Vz4XXb6qb1tFCUYJcWP?=
 =?us-ascii?Q?Bq7+k5DgstOb/zk4mJvJevp2dDkOnTwzmyeG9HT+aykhEkB33iNPTh2vkoIf?=
 =?us-ascii?Q?/Vo9iftYtzYhaSXqQ5yJCOjK9zMgeGPmv/afpHmFyCN7DqsBAgCj4uPGGIMZ?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5wKb55s8ftbAxy9gwUlJLI+42J+cXKk1huxLhhb2IQcliP8pgkrxU4NYIiqiwANKRb9bM8Z1HI613WeVacfg+vfJfE/SXbxFmhSnpfxuw91rHgPsw8LrwmyfZ9f7eAm0nTcQaCIU8M+xqeMyhwaKQ5+y6w0Mc0UoAqr8repWP5eWfeHo7NiCv5K/icoCe2UdvgYS6LzJO2ESRuUFVuKeh1aHZ7oTammQjlMMnip26x19mKBejOzOjWS6MSbWq+8lwH9OYM2GlilN+GmzMgCihrXox53wuKB37Azi6zFgwYtH+ryuzMe8mlpx6zdr+8ZGLipcYFjfOx/9B37RACUVOxYF8Bc7kea3we8y60QsGsVE3J3uQucA2Y6C45dZkeUXkn1HYygd+IC7c6q6QvAjKOqpwyr5gLDYbNycKOtP/4hEln82OO7hUinE65BxwdqBANXelZYZK/j2hPB5Uz9xplhRcO1hR5ydpQlpr2a283YvjS2Tlk81Fve0xkKhf6dCN+Mpoc7Y7Tp7KYeyw+r/ikaGI28cMgM6NHJjESsVKXqOHNP2SBNLp4MXfgiiNWPzj0gY96qe86C9d/SJutJ1dVK9JxFYnCJ4oaoEi9N08Rw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbf9120-2261-414c-e02b-08dda58aa701
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:08.3285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0e7+XGDadO9PfUe7EDzyoyuQBpz5MJx/Xa1OmRD11plT5m9/IV+RFUECD80IJO36mZ4ayktIWDTfIGcgpjRSU/VYCwebk6JIoMfB7fIeaM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: Z05rE9xgYfMuwihGtyY8gh6vExIf_Upn
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6843d8f1 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=C1VMY0C3mZ2_8WTrQPgA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Z05rE9xgYfMuwihGtyY8gh6vExIf_Upn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX5DNZfX/mPn7H ECneDAxHEw8dwNQGghVGbXfsqhA1W8C6cl+/GIEkLjEayXeEKlnefu97UycOACKdQH6ziqzu1sm 5grPN01gcX4BLCmiDqjx8swHy3o1o39rXjODnz6cNOStPYMnWBJbenkP0+JOTOT5np+7W/ZOGd3
 rJ8QQsNHcvrigbw51YD31aAJKIQ33HMFjcKslAVRq1a3FNcGvEfABueeLuislRo+YNIqVikUVAp T2wWvL9vS+zM1SwfOonnwPPBancusOSMXW6C72tKn1ge2E4YsnJvvzhmpm2z+3O4l8Oau21bn5o YSCw6PzoylHmNpQQjSXCohBAMM6arQlRbYARzKMKCvawavqTF/Kn9zGklvD+4CS8HgO5Rb9VEBy
 dfdFn+NSpvUjNocmbRXqaaSwkwz9BlWK0dyUS2vq/PfGdtRRO4nBzN6KDy1PTs9e/ACPyrC3

To check USDT PCs, we looked at disassembly for characteristics that
indicated USDT probes.

With LTO, however, USDT instrumentation has changed.

Therefore, use showUSDT in tst.pidprobes.sh to extract USDT PCs.

Note that tst.pidargs.sh and tst.pidargmap.sh depend on
tst.pidprobes.sh.  Therefore, those tests also benefit from this change.
They do not yet pass, however, since index 0 for args[] is said to be
out of range.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.sh | 114 ++++++++++------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 72434eb9..24fbd518 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -19,6 +19,7 @@ mapping=${3:-}
 
 # Set up test directory.
 
+d=`pwd`
 DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
 mkdir -p $DIRNAME
 cd $DIRNAME
@@ -74,9 +75,6 @@ if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
-if [[ `uname -m` = "aarch64" ]]; then
-	$OBJDUMP -d main.o > disasm_foo.txt.before
-fi
 $dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
@@ -183,84 +181,50 @@ if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
 fi
 pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
 
-# From the disassembly, get the PCs for USDT probes.
-# Check libdtrace/dt_link.c's arch-dependent dt_modtext() to see
-# what sequence of instructions signal a USDT probe.
-
-if [[ `uname -m` = "x86_64" ]]; then
-
-	# It is the first of five nop instructions in a row.
-	# So track pc[-6], pc[-5], pc[-4], pc[-3], pc[-2], pc[-1], pc[0]
-	# as well as whether they are nop.
-
-	usdt_pcs_all=`awk '
-	BEGIN {
-		pc6 = -1; is_nop6 = 0;
-		pc5 = -1; is_nop5 = 0;
-		pc4 = -1; is_nop4 = 0;
-		pc3 = -1; is_nop3 = 0;
-		pc2 = -1; is_nop2 = 0;
-		pc1 = -1; is_nop1 = 0;
+# From showUSDT output, get the PCs for USDT probes.  We look for output like:
+#     Note usdt, type N:
+#       Offset 0xoffset
+#       Function Offset 0xfoffset
+#       Probe pyramid::foo:entry
+$d/test/utils/showUSDT main | awk '
+/^ *Note usdt, type / {
+	getline;
+	if (!match($0, /^ *Offset *0x[0-9a-f]* *$/)) {
+		print "ERROR: expect Offset";
+		exit(1);
 	}
-	{
-		# pc0 is current instruction
-		pc0 = strtonum("0x"$1);
-
-		# decide whether it is a nop
-		is_nop0 = 0;
-		if (NF == 3 &&
-		    $2 == "90" &&
-		    $3 == "nop")
-			is_nop0 = 1;
-
-		# report if pc[-5] is a USDT instruction
-		if (is_nop6 == 0 &&
-		    is_nop5 == 1 &&
-		    is_nop4 == 1 &&
-		    is_nop3 == 1 &&
-		    is_nop2 == 1 &&
-		    is_nop1 == 1 &&
-		    is_nop0 == 0)
-			print pc5;
-
-		# prepare advance to next instruction
-		pc6 = pc5;  is_nop6 = is_nop5;
-		pc5 = pc4;  is_nop5 = is_nop4;
-		pc4 = pc3;  is_nop4 = is_nop3;
-		pc3 = pc2;  is_nop3 = is_nop2;
-		pc2 = pc1;  is_nop2 = is_nop1;
-		pc1 = pc0;  is_nop1 = is_nop0;
-	}' disasm_foo.txt`
-
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs_all | awk '{print NF}'` -ne 4 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs_all
-		cat disasm_foo.txt
-		exit 1
-	fi
+	off = strtonum($2);
 
-	# Separate them into regular and is-enabled PCs.
-	# We assume they alternate.
-	usdt_pcs=`echo $usdt_pcs_all | awk '{ print $1, $3 }'`
-	usdt_pcs_isenabled=`echo $usdt_pcs_all | awk '{ print $2, $4 }'`
+	getline;
+	if (!match($0, /^ *Function Offset *0x[0-9a-f]* *$/)) {
+		print "ERROR: expect Function Offset";
+		exit(1);
+	}
 
-elif [[ `uname -m` = "aarch64" ]]; then
+	getline;
+	if (!match($0, /^ *Probe pyramid::foo:entry/)) {
+		print "ERROR: expect Probe pyramid::foo:entry";
+		exit(1);
+	}
 
-	# The initial compilation of foo() makes it obvious where the
-	# USDT probes are.  We just have to add the function offset in.
-	usdt_pcs=`awk '/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
-	usdt_pcs_isenabled=`awk '/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' disasm_foo.txt.before`
+	print off, $0;
+} ' > usdt_pcs.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: showUSDT output to awk
+	$d/test/utils/showUSDT main
+	exit 1
+fi
+usdt_pcs=`awk '!/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
+usdt_pcs_isenabled=`awk '/is-enabled/ { sub("0x", ""); print $1}' usdt_pcs.txt`
 
-	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
-	if [ `echo $usdt_pcs | awk '{print NF}'` -ne 2 -o \
-	     `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
-		echo ERROR: expected 4 USDT probes but got $usdt_pcs and $usdt_pcs_isenabled
-		cat disasm_foo.txt.before
-		exit 1
-	fi
+# We expect 2 USDT probes plus 2 is-enabled.
 
-else
-	echo ERROR unrecognized machine hardware name
+if [ `echo $usdt_pcs           | awk '{print NF}'` -ne 2 ]; then
+	echo ERROR: expected 2 USDT regular probes but got $usdt_pcs
+	exit 1
+fi
+if [ `echo $usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
+	echo ERROR: expected 2 USDT is-enabled probes but got $usdt_pcs_isenabled
 	exit 1
 fi
 
-- 
2.45.2

