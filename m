Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ACB18C034
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424824; cv=fail; b=NEN4U7O73WaJ5WJ9/gUfnqI/dS2MNdlMXqhIVwpzCy5I5qn0mZrUcwiIYJG3VktwlyvtZTQVuMfH+n3k8xRII0H5D3xtdOy9Usf0pwQuIhVu9Igzx+MEOUYBC5ZS8ZlAPUhu4jOOR1WOW3Lr0KSebstEzLjtvSy7yLR0aTYehOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424824; c=relaxed/simple;
	bh=M+24xXV17D2ywFOHjQ+iwnd+nzf/pAJ/jqVgwe6CMDQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=AQO/Df50kLU3qXGAX+tb2XRQglvPdS2bm+E6PL9mzeUrU944+2EzUqOg9unTYtH9LqUPEyaT4CIxj3Xo6fV+kmAP3WVFD9tX4iHBpD4NYTkM//0bBXYltHArF+/zNdydluN2s0QKC4PHuBt2JhfdDDz2g9ut9VqUiY18B6c3GfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LuhixaxT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NhLTL0Nq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LuhixaxT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NhLTL0Nq"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DfkON007188
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=; b=
	LuhixaxTIF2nJlM2nrrrX45TrLr4iu0jkR2IItOqVdQQ8fvZaFUIMT1VrYH1HuY4
	2hV5u3kAcbeV55pZ8shr1MKr39oRsZ6ZH6d0ZRE/bJedjQs1cLmuSph35GxdZbCi
	/Xq0jOUojpg6qYTK13Tjbe2fQlSRKqnkD4ANp1vhCVSjPY7IURc4gnXTYTTTMQTL
	wJw9RVaDfoaG0VzklM9au7fWIyG3eRgmKokKQeQh+e4pg77fZyeir8NdLVopnaHp
	OCHvd1/Vi2v9WYqfbXMxBU40Gx7yrq99KIrmR05k41T1zB0yZ3ZGLhXOY1UpKKgu
	rNbvC2uJwvVrrpooZPWXqw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437u8tc0mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5IAjjT040353
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836x8kb8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GknZeXXnXNsyr9a091gPD8palEFVvSNzEj7z17w+/uDTrLRe5BDimCnjpGOoVixtpnZcVfwcFTRJvcf5mXDoB8K9dE4IYkvsGswR7877AOkmaaWPEKKM1a8fXo1zLP1d5jHszbTXeKrmhQf1JehFF+wIMWQDAFNCq6+bsLhoSVAGordgbQbd7KxKlf+Md+aKn0jUkaHe3HtRTaTpORY58Yn04KhiwgnH1l5WItr4hr6o+jnCm3VsaQndhEyyvT6KmRrEF8BfaGtRgRs/kWBUfVlrdE85mz8BrIeaLcO8ZeSRyA7L51Td3ypAdGc9LtvzCDhM+YBhDjx7Yyvbf8O7uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=;
 b=ba497YVRvkvSyTxgmRwgSNFGjDIMSPJjVURZCU/C4Q/Ik4KYvF0Aw2B5PS2NC1f86qu+Ul5JFuNNZr/M59tH56Cex3sNiFefxEqGuG0B2lhm4l/11qygw3VHEgWjHk/H+rY4LD3bkWhMMTfINjUSN9mwRnGT9QFol91M/GUjBDy3UB03V/7yFVf7fg7UZnnVdb7F1a6JXpcE/OiXFf/ioAs6pC5sFprjyU7qUdExouDdUyNJ5a+6FeUManDpyl68f2KZ9aaiz4/eU5USL98GkU+trnBGZdWR/oSn8P6T3s2oH3lmdqfJMZgeffntPJDZYqNHKS0LIcRN0Z+jRiuKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=;
 b=NhLTL0NqVaZEWakD0NlJ9qcNUH5x/LHxEosg4uRJJHTwA9JL5DqDimD602nz/6AL1sUsa1EzieIfNnvh8r/vwidK4aUbYDUt6vmVvh6ZICEnCM7/Gdn2wkhmcVs7f3HxEVTU+5Y1Ay2fxKp71NV/DYH53c5DYVt2OSD3zeEM0Jw=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:28 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:27 +0000
Date: Thu, 05 Dec 2024 13:53:26 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] tp: clean up the API
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0422.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::7) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB0037BB841D92FF399CBE8877C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b23977-a97d-4c86-ba27-08dd155e1ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qpFLhmSJSpBkcYrakFYC2kQMA/vCpcYOEVemrgH1nLmyIB0OA3IvxWFPcseN?=
 =?us-ascii?Q?GWcPS5uU36PF/R5lYaPlaW5abVaCvUsaJcBGh2p21+F3gauaMTKj4YDVXhI6?=
 =?us-ascii?Q?g/z5nXAF5jCiLcE+9bOacXJW4OhqRzG3VpwQeWlY8XxPHGnDSws5V9pvXkwS?=
 =?us-ascii?Q?jdtI3Okf60GAEi25b6YHet0b9WwcdxTiaIQx/UZVBRndTiSmyWzQxzZqODo8?=
 =?us-ascii?Q?05Q5Hd0aPWUAKiU9KgSnbHiCTZdnXjOywo8k0rwW69zk333e9ZDUZTi4beKl?=
 =?us-ascii?Q?DFF0haHQydnACfpBpn5HtLlkPB7ftBYUlUPYR4ONEFOMp3tIGFaQMIek4iUU?=
 =?us-ascii?Q?DtVKYiHbuM8LzzBcP29XFmXay4CsVeNzf5N1YJitRtlR0a/NesJPCXrSajvM?=
 =?us-ascii?Q?YdBJYCueGAqe238U7Vc2NbvcJsMbpbfc0d5puB9+Kv7JOsE/t2ZEO06ct5HY?=
 =?us-ascii?Q?ygfneDpg3QqOOLGFmJpKR3OkZtUa6ssKcMNYH7Qsob8rXMiCY+0MFq5iyAXJ?=
 =?us-ascii?Q?m7PKynbRkAtfYmx+xos8Plc5z6Njbe5NTSdf6A+NouQuewK848GgBlfmsTxw?=
 =?us-ascii?Q?Ywsb2cMLdn4OUA6kfTXXQqz+1BBNtBVPy7yp4F2eYPd8otAHh+TpZbei3QN1?=
 =?us-ascii?Q?YHcnh4fK7FVJkcdoDFXCzhmGT+7fxprmf6AxD23qdVE9cm9Q3QA+tP36J9eV?=
 =?us-ascii?Q?TayZdid6ASpMTAR/3VJsYW7fK7gGnsWNm+T7Cn4/dpIuc9+5q05w2i0gCr89?=
 =?us-ascii?Q?urC+MYIkcWp/d78D5pUwGzflLg56BBLxGR8UrA1QdDBg1ENq0n/p0i562Jyj?=
 =?us-ascii?Q?lRRnlIMi4aaK1FcwcwkunQfqpF2eQHw7njpDbSKFzcC3LIWN1pqGQeddDWqX?=
 =?us-ascii?Q?Xetjwa5nzbQpRFiaVyA6CT0L3wMo0Sk4sL+kqZyMFhoUYuy/zIMe8mTackR1?=
 =?us-ascii?Q?We3BSjtynTeniQQflCNYIWogmp3DeOBAicoYAzmkuUDs/iDGPMG/mev13zj6?=
 =?us-ascii?Q?siUEfH1Imx2B9u3hrCGohIul41r7qv+EuzSnJdvYVJIaXHVtx9Dba4lw5gll?=
 =?us-ascii?Q?PhkHviiNWxF9l26Zfnz9FHwhQEonTq8ch88uRwHfWlc407HBqeLKxXIeMqCs?=
 =?us-ascii?Q?+xpMuGRldidoKsheZHPzl4qTHZOFI2xKoJAbTldUAk/UuNzbNYZuNCQGcK4o?=
 =?us-ascii?Q?5rnflI4ykvWv10A3mQ548eiW4mR4es/YFIgT9uaxVgxKFbuOO76lNZoVIzGf?=
 =?us-ascii?Q?0vcpt4Tof4ljmsTXaqJFybev41W5EaubZlMC+NB8khUv0rXTq3myF+gs46ep?=
 =?us-ascii?Q?2kiBXUEcsgH6i3yqvbeRHC32Y4w8xHI/Xnz4/1S1h2HcYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/YaizeHFhLDGGIaUzCPywhmAYZMMco7XsnemyOq1ws3Y62SpCeYbuA91oIBM?=
 =?us-ascii?Q?edy2eGqgGkNuT1awkIr8F6IYtmc4CbqbQkDYWuF4htPanZlpifHVDqNMd3YU?=
 =?us-ascii?Q?zYivLvIui+2fM/YOtzI6L14isw9u4HLj3+9ef+3bthqa26HL6q49kwR4FlYi?=
 =?us-ascii?Q?Y+qhR59Fikxs5Qg1d8iu4Gw3OKm9TxSfczSaiIyXGrSAbQoR5sCOIgU5eu/5?=
 =?us-ascii?Q?ESeYgh/mxRr6USS2bJn3C2fz9pOGSi9AFbdNnlfciPA57e0BmfXwcRKXw00Z?=
 =?us-ascii?Q?75RD4D2npRWML3Rs9jME9vqsyr8zBg3fQP5rs/TOBte9MfN3AIMPYwSdf/E8?=
 =?us-ascii?Q?M8893zhweT65qOizCLXWIVScqJSYY2DOPGO83EOrSCfUGFFMxd5quQZ1yM4c?=
 =?us-ascii?Q?qCKqAPavyCMR2q5dZbyezGFESNJa8YIRfXaebp93//QhliSptTfAOO0b8BNv?=
 =?us-ascii?Q?Rsa2KsJLDrGeuNdudIO0KYw30yRFOnjl4SEBKyN9QG618VmswbQdvh1TREM4?=
 =?us-ascii?Q?bPXcEAdP2lFujjgTdFO7bCTZG4H7eRZ9hrms2T2paoiszskJjZx4KHK3ppPe?=
 =?us-ascii?Q?kd0+TDlQSCC1wClnSd1Y63EZKQDROGSbIKgg78td6gnHl4rRfdlaVOs7qb9J?=
 =?us-ascii?Q?5jAQNPidAmQVUpWOHVJhcBaN3Ua4ZN43+Vitok9qnmy8h0ZF7bn26ClZR1It?=
 =?us-ascii?Q?RIauVsqTpcEQaB5Vp1OJ+f5ufKwLASHPGZE+VNISCvif9MRzBORAUt1rYrjr?=
 =?us-ascii?Q?C5q64DROa1rgLuSYgM7WnbHU1yeotuP2xNhraP/V2jL5ZHnKVaWZH58Y179i?=
 =?us-ascii?Q?bWOxsEMloLxM+G1c6mcZKpqRqvigjxpMpYKx38pzfdl2JMiWiyYEpLMrkFKF?=
 =?us-ascii?Q?kOl26mObCjQFs1NbQ+m7klf8xKM1lxqCxZEjQoD1P5XWo3ztsBfduFiTx+8X?=
 =?us-ascii?Q?1m2mWBcaKEQN42Drv9DHT/K0NlJ0qWSVWYxhe4VcZ8hDWLhZXnSFzpsa55lx?=
 =?us-ascii?Q?9kYcWBFmDrxAxYr5eQY4YgtBSI8M8NoG2n+guN+0mJ1vTMoBrBi5kXr0dkAU?=
 =?us-ascii?Q?mS8Y7zN78UMnoI78gv3LSxaRg4NRGItREAit+2rxtDfPZjGcl+IFAjpiRUBy?=
 =?us-ascii?Q?w+w9SgbVQeThARat+D1IWsZfokFyf5pVamWmZpTlHjke5AB0yYGU5vdaXcRa?=
 =?us-ascii?Q?6iG0yRfrqvZegJiIxPexN9idqvnuFU7KGNlb/p30FmuekXmWJux8Dnkjo6SR?=
 =?us-ascii?Q?gXsvX9eNRjdFaK8UO7YjibfHYQo9ZJyzGVH5qlyjlVrB99bArNzGvnOs3CJT?=
 =?us-ascii?Q?ex/DyDOOCLO2QsOES5id0TPH7kKmheo2VLPDew1IPK7wiZLLdYtObfzJKb2O?=
 =?us-ascii?Q?xLswnQsptkVucaS5+i4evbPICOv6PfRHh0yKFjXCHBBHmhr1jU8pTVhDjPSH?=
 =?us-ascii?Q?9a/66m1VD9DQkhsS8tH30iE5KpsSgqeNi3I0mZoJEiKAkeWmDzkMzFP0rGWi?=
 =?us-ascii?Q?cL+ttHf3o7HqGX7NIcc72+cGpQ+Q6tVJtoCfMcS++Ij1VD0AA/FwGKgda/7T?=
 =?us-ascii?Q?oZDYECVOwp8DrwZV7bA5ZA3Y1ft/tONll+2bsCrGKh3F36NrZgNQTtZmwZNX?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wYMqrVRPc8lnRo62ygtUbaRzvvhG0RDTjRqf5zjfSt/DfFJ0UYi+KzRU/wBRaa5WI+T6Z9Lxy9vCXRbrfDUTL8c/j+5Jx1A1TdyBRM/SgPlWiOK4c3ZYj3QuC6tzDjohWUWw5FwXWpL6oJZ3tVjnf5ycJTJr5rhN3rvSK7GHCUBnXnIeP4Yy2/63IJpI3azcgqwAoe7sowkJU5kkdMZtgZLacsHm8IYznsBvkYJYl3j3wy9T/MGrMZgyxl00kpobNkoNoOCG5h5gNcS3HEDLos1SbEcAjaqrScjrbjtZWhG/eqyplKLIvtGy0s0/hRuecTk3nLJQ0gBsgKB1I46gocf1iF4w4upStxuGuUFFkqvD+vOUQau1zqMvZzdTnYFX4UPWR9kX5P2gDMSwGxCrzfJjilVBQ+toR4KT6eHrkVshrxTyVDRAG1khbu7InHQQYj2NC8u/TxV7Y/i8y0vdxIOKnunEf8r4bDWGkHqyg/s2AuqiGCkYDvivVdSJAe0nYNjszStZLjr71QY3H4qgwFeXdomDd32yCkXmvX55FdrBR1KL9E4S+PGmcY81F1XRMdjaAPz0D4Fw7gGboYKofy5+VqpYv1XJFmwjhOVJxls=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b23977-a97d-4c86-ba27-08dd155e1ab7
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:27.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: go+FUxAeTMllIYEaG8ZXXEdr3WA+gUaKfUZpo7g6uWMBPuSUYMIN9GuCukAbsVYIaKPqCVGaHfDxltDAZZOFyhd73C51eVEhAK0HKu1q0eg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050140
X-Proofpoint-ORIG-GUID: t5P9Q_hzMiRa0xbVo8gzsFSsOv56YRmD
X-Proofpoint-GUID: t5P9Q_hzMiRa0xbVo8gzsFSsOv56YRmD

All functions that can operate on a tracepoint object had a convenience
function for probes that are purely tracepoint-based, except the setting
and getting of the (event of BTF) id.  We now have dt_tp_probe_* and
dt_tp_* variants for that.

Also renamed event_id/event_fd to be id/fd.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c    |   6 +-
 libdtrace/dt_prov_rawtp.c  |   2 +-
 libdtrace/dt_prov_sdt.c    |   2 +-
 libdtrace/dt_provider_tp.c | 129 +++++++++++++++++++++++--------------
 libdtrace/dt_provider_tp.h |   9 ++-
 5 files changed, 90 insertions(+), 58 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddf..da288401 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -208,7 +208,7 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
 		if (dmp && prp->argc == 2) {
-			int32_t	btf_id = dt_tp_get_event_id(prp);
+			int32_t	btf_id = dt_tp_probe_get_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
 			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
@@ -239,7 +239,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (btf_id <= 0)
 		goto done;
 
-	dt_tp_set_event_id(prp, btf_id);
+	dt_tp_probe_set_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
 		/* Void function return probes only provide 1 argument. */
@@ -306,7 +306,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		return fd;
 
 	rc = dt_bpf_prog_attach(prp->prov->impl->prog_type, atype, fd,
-				dt_tp_get_event_id(prp), dp, lvl, buf, sz);
+				dt_tp_probe_get_id(prp), dp, lvl, buf, sz);
 	close(fd);
 
 	return rc;
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9c..f1d3b6bc 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -221,7 +221,7 @@ done:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	dt_tp_set_event_id(prp, UINT32_MAX);
+	dt_tp_probe_set_id(prp, UINT32_MAX);
 
 #ifdef HAVE_LIBCTF
 	int			rc, i;
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458..74555f5b 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -241,7 +241,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (rc < 0 || id == 0)
 		return dt_set_errno(dtp, EDT_ENABLING_ERR);
 
-	dt_tp_set_event_id(prp, id);
+	dt_tp_probe_set_id(prp, id);
 
 	if (asprintf(&str, "struct trace_event_raw_%s", prp->desc->prb) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 50df2328..3d4ec1e0 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -31,8 +31,8 @@
  * a tracepoint or BTF type exists yet.
  */
 struct tp_probe {
-	uint32_t	event_id;	/* tracepoint event id or BTF id */
-	int		event_fd;	/* tracepoint perf event fd */
+	uint32_t	id;	/* tracepoint event id or BTF id */
+	int		fd;	/* tracepoint perf event fd */
 };
 
 /*
@@ -47,8 +47,8 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
 	if (tpp == NULL)
 		return NULL;
 
-	tpp->event_id = 0;
-	tpp->event_fd = -1;
+	tpp->id = 0;
+	tpp->fd = -1;
 
 	return tpp;
 }
@@ -62,10 +62,10 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
 int
 dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
 {
-	if (tpp->event_id == 0)
+	if (tpp->id == 0)
 		return 0;
 
-	if (tpp->event_fd == -1) {
+	if (tpp->fd == -1) {
 		int			fd;
 		struct perf_event_attr	attr = { 0, };
 
@@ -73,21 +73,45 @@ dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
 		attr.size = sizeof(attr);
 		attr.sample_period = 1;
 		attr.wakeup_events = 1;
-		attr.config = tpp->event_id;
+		attr.config = tpp->id;
 
 		fd = dt_perf_event_open(&attr, -1, 0, -1, 0);
 		if (fd < 0)
 			return fd;
 
-		tpp->event_fd = fd;
+		tpp->fd = fd;
 	}
 
-	if (ioctl(tpp->event_fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
+	if (ioctl(tpp->fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
 		return -errno;
 
 	return 0;
 }
 
+/*
+ * Attach the given (loaded) BPF program to the given raw tracepoint.  The
+ * raw tracepoint is identified by name (tpp->id is UINT_MAX) or BTF id
+ * (tpp->id).
+ */
+int
+dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
+		 int bpf_fd)
+{
+	if (tpp->fd == -1) {
+		int	fd;
+
+		fd = dt_bpf_raw_tracepoint_open(
+			tpp->id == UINT_MAX ? name : NULL,
+			bpf_fd);
+		if (fd < 0)
+			return -errno;
+
+		tpp->fd = fd;
+	}
+
+	return 0;
+}
+
 /*
  * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
  * the argument types.
@@ -120,7 +144,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	size_t		argsz = 0;
 	dt_argdesc_t	*argv = NULL;
 
-	tpp->event_id = 0;
+	tpp->id = 0;
 
 	/*
 	 * Let skip be the total number of fields to skip.
@@ -136,7 +160,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p = buf;
 
-		if (sscanf(buf, "ID: %u\n", &tpp->event_id) == 1)
+		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
 			continue;
 
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
@@ -287,7 +311,7 @@ done:
 int
 dt_tp_has_info(const tp_probe_t *tpp)
 {
-	return tpp->event_id > 0;
+	return tpp->id > 0;
 }
 
 /*
@@ -297,11 +321,11 @@ dt_tp_has_info(const tp_probe_t *tpp)
 void
 dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 {
-	tpp->event_id = 0;
+	tpp->id = 0;
 
-	if (tpp->event_fd != -1) {
-		close(tpp->event_fd);
-		tpp->event_fd = -1;
+	if (tpp->fd != -1) {
+		close(tpp->fd);
+		tpp->fd = -1;
 	}
 }
 
@@ -316,6 +340,24 @@ dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 	dt_free(dtp, tpp);
 }
 
+/*
+ * Return the (event or BTF) id for the tracepoint.
+ */
+uint32_t
+dt_tp_get_id(const tp_probe_t *tpp)
+{
+	return tpp->id;
+}
+
+/*
+ * Set the (event or BTF) id for the tracepoint.
+ */
+void
+dt_tp_set_id(tp_probe_t *tpp, uint32_t id)
+{
+	tpp->id = id;
+}
+
 /*
  * Create a tracepoint-based probe.  This function is called from any provider
  * that handles tracepoint-based probes.  It allocates tracepoint-specific data
@@ -334,22 +376,6 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
 	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
 }
 
-uint32_t
-dt_tp_get_event_id(const dt_probe_t *prp)
-{
-	tp_probe_t	*tpp = prp->prv_data;
-
-	return tpp->event_id;
-}
-
-void
-dt_tp_set_event_id(const dt_probe_t *prp, uint32_t id)
-{
-	tp_probe_t	*tpp = prp->prv_data;
-
-	tpp->event_id = id;
-}
-
 /*
  * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
  * the argument types for a given probe.
@@ -385,28 +411,11 @@ dt_tp_probe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 
 /*
  * Convenience function for raw tracepoint-based probe attach.
- * This function is also used to attach to BPF ids, because those are also
- * handled through the raw tracepoint interface.  These probes are identified
- * by event_id being a value other than UINT_MAX.
  */
 int
 dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
-	tp_probe_t	*tpp = prp->prv_data;
-
-	if (tpp->event_fd == -1) {
-		int	fd;
-
-		fd = dt_bpf_raw_tracepoint_open(
-			tpp->event_id == UINT_MAX ? prp->desc->prb : NULL,
-			bpf_fd);
-		if (fd < 0)
-			return -errno;
-
-		tpp->event_fd = fd;
-	}
-
-	return 0;
+	return dt_tp_attach_raw(dtp, prp->prv_data, prp->desc->prb, bpf_fd);
 }
 
 /*
@@ -426,3 +435,23 @@ dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap)
 {
 	dt_tp_destroy(dtp, datap);
 }
+
+/*
+ * Convenience function to get the (event or BTF) id for the tracepoint of a
+ * probe.
+ */
+uint32_t
+dt_tp_probe_get_id(const dt_probe_t *prp)
+{
+	return dt_tp_get_id(prp->prv_data);
+}
+
+/*
+ * Convenience function to set the (event or BTF) id for the tracepoint of a
+ * probe.
+ */
+void
+dt_tp_probe_set_id(const dt_probe_t *prp, uint32_t id)
+{
+	dt_tp_set_id(prp->prv_data, id);
+}
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index e7d52876..f131b1e0 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -30,19 +30,20 @@ typedef struct tp_probe tp_probe_t;
 
 extern tp_probe_t *dt_tp_alloc(dtrace_hdl_t *dtp);
 extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
+extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
+			    const char *name, int bpf_fd);
 extern int dt_tp_has_info(const tp_probe_t *tpp);
 extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
 extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
+extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
+extern void dt_tp_set_id(tp_probe_t *prp, uint32_t id);
 
 extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   dt_provider_t *prov,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
-extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
 extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    const struct dt_probe *prp, int *argcp,
 			    dt_argdesc_t **argvp);
@@ -53,6 +54,8 @@ extern int dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const struct dt_probe *prp,
 				  int bpf_fd);
 extern void dt_tp_probe_detach(dtrace_hdl_t *dtp, const struct dt_probe *prp);
 extern void dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap);
+extern uint32_t dt_tp_probe_get_id(const struct dt_probe *prp);
+extern void dt_tp_probe_set_id(const struct dt_probe *prp, uint32_t id);
 
 #ifdef	__cplusplus
 }
-- 
2.45.2

