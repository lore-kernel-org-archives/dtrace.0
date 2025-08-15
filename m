Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DECBEEAB
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755269713; cv=fail; b=jNxJ7wEs3bDSXOAqWYkRV4QrxoWIu1F8rb0j51BMK4nxIerUmO4aaUJFpAxe1aIGQARTkHSASrtr+uppxKSFgnwDSKg0SF8uZj8/bXRPCoxLd/nDZ/tmjchIuNwzcHCz+XSwSMu8lEriY973mOf1YCtBoQNxmn6QmV1YYoO/fIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755269713; c=relaxed/simple;
	bh=POLQ0RxzuZzPMHDfzWs4sc4UHtb1JnCZCKhWK4zgNPo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=rsVBnW8wpI3lTPfVHp9XGwAfBmKrWqA00kZ8knjRZL6DMWmd+WGzmlUbYaDRRozCmaiEzgrZawoCGSXAw7485xR3Laz2f+TyD/suNZlJL1cN/zwuqli6jHuA6LqNshnPx3D2yLpUaNgvU0xjTaBBeCGljmkfTtfmdW58EWC0zDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MRUFRncM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kf27tubp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MRUFRncM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kf27tubp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN5gj009226
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=QwqgaIFCHycZa5MXUG2mkPVAUnSABiE2VAqRSv3cMMo=; b=
	MRUFRncM5iZHRFEdC0nFZtbd3fFhCFVOIlNmbocDx63MA/Qsp6r08Tk6oQ2cEJAc
	fqD/Pdf47wj3J+Tg6AD5VM7weO8JzCSagmmOMYPC5kKZlMHyrefwtuiSMPtGXAKI
	768RVdav/jGDfQr2SamkiAia8FUoVv/hBKwKaiafMeShKuhO5CT47hr5MBFa1SXD
	GnjyRkqlqxkbTAPb13NI7zYH8bSba4mhTjfO7IKcB+tVH8IkU33uuYDjtRJ7Ywt2
	QNL2MJLfQj1icoxQESTUcPU/r1Hic5gpc+AOrpLlAMh67RWW/HyUYVK3fUKHjxKc
	TNHn7eIOGEd65zTa8dVR4w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcfc7uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:55:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDfeDo038700
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:55:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsmmf3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 14:55:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=boEQXzyLPeIw/LHsiY6ymYzqXEwfvEd2IrK7J/lLMsSJhSC5+wf64qpVS3uUj5ThPt4kWF0jL5ZbdRVy0QR7eQZyLwUT+eQAxbGVXDGmdb9CaxW03d3eMg0c03kPafiKohpIKuTXZsWdmh21ne4RpiVujHfxCHa6Tv7WGUPPgGasOAEwFNG1CjSQFthjf3FAWZUoE8uGpQXkQ2vz9WiNrb+xknJ/27546TREW53vp8/pNg3YtqbpqD5rH8nP7g7+7LT8/R3CJUkNIcqe+GSW4CfOOqrs+LJJO7SVAxBJNFOl9MjToTK18ELYkb6Gi2pk9z/vEVbvsdiWwSLK9bPs0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwqgaIFCHycZa5MXUG2mkPVAUnSABiE2VAqRSv3cMMo=;
 b=haM2aDdm+vIE+chCowPIZVfLp8zv43auC2Ib9XXNqbA68VFC3rJjI36YZCEm14/sVHVoNWYGciey6D/kCvEAR/Yin/OV9S5DYyH45oWdTtBhoFImQLlogOdAVj4Rc9sg7H+rBEHA7/RLUgdmnvz5RxPuxo6cMse/wcBmhD2sFPyGdr/HkM/TkwfYSnI/T4cKpv++BbwxdApBqHYkUkjS8RFrRipleSIab3aXXKwI+KHaZyORQuzzCq2nFLiDqfv6a7XWBSowJM3bvNREBb7lI83tux+vqF6nxAIFtor66JietDoNGCoXe5vrYCrwZiASx0YBin99eRXKrRORq80IVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwqgaIFCHycZa5MXUG2mkPVAUnSABiE2VAqRSv3cMMo=;
 b=kf27tubp204NRjJ5mxb+aMoGghhPfa/SyrL4m+zyLtzv0KSFzrSVecNq7EjT8NB5sbtmmA14U/uxZRe1+svfjCGoLdvuJ/o+yRzqxxrvYaLY6XsFXZQWvGVEHw9gb6X2rh4pMfCDeCWlIwsyuDc+5zmNPuxhDv/FOS3x6k0zyV0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8539.namprd10.prod.outlook.com (2603:10b6:208:580::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 14:55:05 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 14:55:05 +0000
Date: Fri, 15 Aug 2025 10:55:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 7/7] uprobe: do not call populate_args() for pid probes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56729DEEAEAB33E8D287851AC234A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f05ead1-5394-4a05-d2dc-08dddc0bb83d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fGiJWiVw6b0bXOO9pXOHGK6G7Wyxp/8rWsWy5Zh5ZbX3lPjaA4iK3uZ6LIkH?=
 =?us-ascii?Q?+jJW+swVamFTWCfNOzCXPp88aMXkD1/ZN5f8M6RLNmz9EhBUUrrWpvysUGt8?=
 =?us-ascii?Q?/EpGRC5ukgoto83xN/FxnbJAQw/alkAZAeXYHJ7OUvKu+r/wJHtdJTx1yAkD?=
 =?us-ascii?Q?Bb4k1M/Z5P6kAnJFeFV3J9oGQGnup7V4A+JpbLQK6H3YxILgT5KVX837nNo9?=
 =?us-ascii?Q?dLKdMJauAE6ncAMBTrfm7JU57nkIPgaznL0+bouSU5UZJJ1cP0QI/REzsXL6?=
 =?us-ascii?Q?oaLKIPtpRk7hbJz4TAw8N4n8GHZzyBI9lTGrE5gYnJX//k9rg2umEENICMCF?=
 =?us-ascii?Q?CVcioVYaHH5FtTS/G6VOKdDeArHWAQMP6iUZT5WhvmwSVDnDugYuntPRlRyI?=
 =?us-ascii?Q?vGiEoKUhALbGU2irhL51z0JrsY5aRvpCd4pfYWO73qJOkCk8PZGgoEjo3hCZ?=
 =?us-ascii?Q?PBaQnkZ04VbYrCu23O1Vl+1opCpDEXaD4FVMaW+I4DXeYXcfExe1AElipqw4?=
 =?us-ascii?Q?tYjhBwYrAYp/IyJ0U2S+OlOhlckIYcmSVvzWNYnij8gyj8XQfzPDIn8uFKXR?=
 =?us-ascii?Q?jnQFKS78CmorQfn1gRNed5TNXtwb3XmYpCOMh74Nftjdf/XbDYgmRT3GcKdb?=
 =?us-ascii?Q?GICutYi0ieaZsD8TubNUSOSEr2GEwGqHaUeisxpldFqfCeHPcz61pnRLO/Ki?=
 =?us-ascii?Q?dp9n0XcUDaxDFzaI9d/kbX7ZRLYmX2PuwxVly+YIVnoJTHWP93R1nO+WMmq0?=
 =?us-ascii?Q?2EN/yy/TYfagXf1pyhHEJmy16Cao+wsaQdL8SziAnl11LlP9efwJtISUAJDJ?=
 =?us-ascii?Q?v0adehF4qsv7VmCOvYQY7NWUQh7r41DlQXnYg56tGB65IICC04p90l5gKlSb?=
 =?us-ascii?Q?AcSN0+THTe2biQh1diQg0wt43tOI3Iuug7ACHgvww4c5B3sAWY5233bWR1zQ?=
 =?us-ascii?Q?zbljKP1TuQpJvMWGqW95L7rdg4WCs+vwP++HWr+aUmtiYaipvaabS07c29Qs?=
 =?us-ascii?Q?zfrVtNwZXsEo8RK7tiX88eAG43FFrc/anoURcva/31LAjejcL7EvCyy1ZL7l?=
 =?us-ascii?Q?5z4aNPCI1BI0/4T10KRtJM/FQIUs+zy++MVudHtTTopiiZVxt0zTshBm9zYj?=
 =?us-ascii?Q?+dBziIACLwqgqxmZsMLF/Gm6VcIHAcvIf0JFPx8SbmHrBpnDDhu4qLfGIZdi?=
 =?us-ascii?Q?hJixJtNaGh6PIFlvqRc1LszpapbJ9dr9YBtE2msnu/d49ZhQ/7Rz9elU4478?=
 =?us-ascii?Q?zQOzY+L67sleMBazwC5QY5L5DS2B1laYj6ETA94SACRQ1ZOgIJYHTISybI9x?=
 =?us-ascii?Q?US4pEUDg5QH2C0BhsMSc2ND/ZL4VLfZm4jZQuo9BTC+OFDlmdJm7WM9z2h60?=
 =?us-ascii?Q?mMxNb7b4h0ZqiEU41vNM1eI8Pl+TktPp8zgaNrD7SKCvWJ8AEyGqg2nMnNFs?=
 =?us-ascii?Q?Py5WY9BpRT0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EdSo+qt/3oq5gDa2EnZyLiQC9Fy+h797OFqs5ZGPFOpFxwc+GF0pvFnS4hvi?=
 =?us-ascii?Q?6nK4xc4EwpRqJe8y3v5c1NQewKlr891LTpTfR+ATXaQM5FqLsSMLpRzV91xG?=
 =?us-ascii?Q?UZTXRX5lAkqEPi+tkDkxhlnjJ3Ein3lDvuSx8ptXZqpG1FuTQg4Dg33GTOb8?=
 =?us-ascii?Q?GlllD9T1XSe4ErkAf+g7vDUZlfXh9iTBB8xsGWBOAgtZsUkYyc6Vkoze6QIu?=
 =?us-ascii?Q?0EyebIWcKlCNgDnFTNlqA7WtNQPZxcoYQnggKzPSqKTVhAwKM9BDrPBy/Vsy?=
 =?us-ascii?Q?BUQ7pN2Vz1g4Qu5d8u8I7ruGIDigQUKuhhhEqrt9mJlCnRYpZB4co1nyfl4A?=
 =?us-ascii?Q?654W0teQ9QPuzbvuY8heq5pc8XVwBXsd2V75/z9uQcMhrWRoH/3NbX9xltmH?=
 =?us-ascii?Q?Z+aF0DrVoDLyFnqD3N2PdjjCkZxG0HMUCY2Q8w+BdnhD4riNPs4tzsVwgpg2?=
 =?us-ascii?Q?oOgzfAYmNmbxln+XTu++X6JHZvUOc36WHOp2Tcl2KFSoI0PNDQH15zGUgC9O?=
 =?us-ascii?Q?/bvXq6FQaK/Y67CJSdkAIJEdrwyjoSj9g53WP7xzw6rW8c+NRH2KJ91x8p5c?=
 =?us-ascii?Q?q+vGNjz04IQH2Hh+/AM+bo5iMr3enPbIyAfRdZq5vxiSfXadborcc1/bQMZv?=
 =?us-ascii?Q?UEyNlziu+wc19jn1QKSEfuJdlgcV/Q/L/ix14tnm4x0OMurQ7dbxV4L3/n0v?=
 =?us-ascii?Q?Gfwy1mZVHciwXjR3OvrYvIsrXXi4CpMEeF51AGRwDeCXJBi9+wdMBB9foxNT?=
 =?us-ascii?Q?zXVBHJxWUztLsmARdY8XAX5bys2Zl7H3BQCpoTDzAoVG4JEpNTc4Yp1yjtBU?=
 =?us-ascii?Q?hr5U41TR1Srpy2jU2mM0fqw32YgbqFckKPv0MaJJFcHWPbagwKtm9Qil9BZB?=
 =?us-ascii?Q?r5KcMDO7PF0LiMIsqu/l2rdYyAqbutp2pN3vjbxuO9JiCjPF5vkJIK94paaN?=
 =?us-ascii?Q?SFzkye/0mdL+XgQ0RzfWvth1uookLOSRWfIz+pFqV8Aghxywd/pAd0bG8LtS?=
 =?us-ascii?Q?ijYLy+2nIQv0ySJgHouEbGvfMifv5Nr1Menmof7dnp/DJvjHQjVghSvCGU1H?=
 =?us-ascii?Q?Jfxe9IKNyQwW97uPRItHWIqlEksOUEUDLxQIb/x7Ux7/nRvXCnunlSb39uvn?=
 =?us-ascii?Q?2x8M42gcSyLCfx7dczMJrVCgxgTuofGNtJDkOa6c4DrE4MfVOfzKNQAOPfSV?=
 =?us-ascii?Q?zqWvkqlukKxhR0dHbMUlxoJtzXwk4DarrWBmN013eQ8SrBuEm9RRLciw5faA?=
 =?us-ascii?Q?vDhAGBdBwYZFnoFuS81DL5qEBH2uFruYWmQgzdNneUt5heRjmqo+ijlrDBno?=
 =?us-ascii?Q?wo2vrfEG/4NnEByMK3Yf0QubIA4ly0Hnsc+cSPe9xpRNe/b/GdH5iaHwhS6S?=
 =?us-ascii?Q?qWE3/RLBmoUXb5fTtjVR7MPW+hFft0AUj0Qr10DPbFVAO/s/5PXSZEUfOW8j?=
 =?us-ascii?Q?uiQ7X04J0sV0mTR3ezfrJ5sFfTEBcp7+H9ice/GGHprWe+zajLjzQaJBMHlB?=
 =?us-ascii?Q?VaJM4omZrQzBwXd0ggQdmfbBTJ3mPYqz0X0Wnb+LPFTvooaKxR2wnp/Zoedx?=
 =?us-ascii?Q?LlLIEqe+OTOneTiHFey2AHE/sNKN/e342XMiTLVM2XAZ+jyOwmJYZAHzZiLF?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PnNShbhhHCRn7HtggIprdF6w2TEhUH5r3bMVapwRsamEfWJE4WcW2oDHjdM0xDpVQ+gUEI19fvi0nnNJb55QRE7xfxtXbic9WXwFmgtOw/X1WkoIuHswFGvDmX9oCHM4YL92hXyqbbtYGkr1/85kLvpza7vXlyxqiFPmT7pcz7wezCw8sH9OUatMPEqgH87pCnw/VXOvY7stddgyuYM8weqtjH56s+wP6v2Z4qBjpVg3i92QCsxoGzJEk7Mv4pupYDVo+cpXRwfJHP7E1QVIT22c6QYi2KrrzYUYaZCCya06eT/5h8ByULDVkuxK2u1KZiFFvz0NCmoAKknkXUL5B6flI4g+vXXvRgdme2Ka10I504QKisztwewNbZ/Fp4wxeEOMsLxkvoPXOhqFyM9PDNY6xefzg/VoxZqYwGrqEa6knmQG8yMa/n8SvpUfhfmAPaGCWngQXeRfOfAfU5FmaSTdiqMjVNI6MYw4QMPmPz8OIuDEaC2M0w3p/1L/2LnVkIVpQ4Cdjp1DCIpQLZ3IWhxAtPN1Uiqz8SWrNhKT2yJ0eMSMNlv6JPb0u+LRDbwxLbIoDOjwsJhI5VyGbos1R36iVY9H/C5Zrws/TbzZH5g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f05ead1-5394-4a05-d2dc-08dddc0bb83d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 14:55:05.1057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMZ0cdr04Hxk0OP4Wpn5UQAjjieB3/Y4cCGE8Oq5Cy2A3T8pt2m11exJI9ZayZZm8+eFXbYkwwh9w+TpozRM3BBX3frxjBBtBT/1Wz0MnYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150123
X-Proofpoint-GUID: tEbMDsTznoj2bSmMbHTD8BnOLDnlwyVR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEyMyBTYWx0ZWRfX9DESGAnkWaGS
 AqXz40MyqmIgwrrau9wm03Nuuoa1igN1sTQ3df4OYRYaBx3oeN5y8aOjH2DzdDg6X80u+BXnAr2
 T0kGWaysNxhbs+cHmldIkxwCRK4TPrhKfFOiAZgGy4/6OT2EITR7rSdGxgxmknkTkXl8tZSXBFE
 /NkaF7a5LL9DOq5Juqfh2ym5WCKwxcIRqcaY4Q+2WR41s+INI6aJv8cqePUdLaA0SFZtuuzWDOP
 0D6x+cx/8+dBrNOL32B6awiYqQB1zi0ed1oxNZ3xvLPd/zOx1Ipd9iRTXtLBO4mQKFxGZYlzFCq
 DP3IpL0hsCGNPIU/+haCa2D4guvlwVpsp4yH/M564EGIedOhc1B2tRZfRvyELrLpzkE3RZYDDsn
 qZTuei+xh/dIxIL/fb1+yTLSZptEinZbO5cWuFQGhdvKcemGWj36PDVQ/2ZmWoYVWsYR5xA0
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689f4a4e b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wiqchhF_qrdbZNUoWqcA:9 cc=ntf
 awl=host:12070
X-Proofpoint-ORIG-GUID: tEbMDsTznoj2bSmMbHTD8BnOLDnlwyVR

Only USDT (regular and is-enabled) probes need populate_args().

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index c63d58383..07b26f20f 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -986,6 +986,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->flags |= PP_IS_ENABLED;
 		break;
 	case DTPPT_USDT:
+	case DTPPT_STAPSDT:
 		upp->flags |= PP_IS_USDT;
 		break;
 	default: ;
@@ -994,8 +995,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		 */
 	}
 
-	if (populate_args(dtp, psp, upp) < 0)
-		goto fail;
+	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
+		if (populate_args(dtp, psp, upp) < 0)
+			goto fail;
+	}
 
 	return uprp;
 
-- 
2.45.2

