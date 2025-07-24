Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD32EA49D
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753372222; cv=fail; b=nv//RBMZ8QdiSvn254a6/xaddw/Ljlm74A3EfsKmpn5qVLMl12ICRd4n2ZNiqf2n1Uzpe07KyPktz6kBr3AjPp458bH2spquQ3tUpmvnPG14cyQ1p3DlnRcaow3q3Nifkqm1WtFgp69sk3ZxKCPGvzRkJyjilf/oJnqFUmFjgLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753372222; c=relaxed/simple;
	bh=jR1za/DKIySJ7bjRZs/b4Sil0YKhpiTOl44PN5zpCms=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=o8YCBX/hRcnd2A/ucVUppTgBpKSAnv3S+h1n3/eqPufBGL9dzVzT4C+IWNq48IVxLYeRAsb3sben1bqnG/t0vyipmtO8rioda7TMYRwtr5OkCEIJAygyMStgRPXObxgc5Yp52+y9NtSdIiao9r8cRAzDj8tY4HGzEDZkLkaxeuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U5pbl+FW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C8X3hyKz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U5pbl+FW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C8X3hyKz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ODRPtS013348
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 15:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ljv9VSaX4CcYK0eTEmIf/E9d9fBOdieyC6gUGTcD7rY=; b=
	U5pbl+FWMmpmAGEqKTlTkUzGtmivGSMQthzYlL2IouhUzxOv5h8AU9f/27Uiwrfb
	BAPIYR1cAILmrLrGArbxBIRzkNO7+sBGCwVq2T7joGYJ9FUQG2r38ZkN/hGPmVV2
	sd+TU4CMm2Lo+mFTFRcAbpV7db7MYalQ0/pi5Mp1pYszG5SXxuwz31bEawj3Kfwd
	MnIXanUexFRpjjU9bt7/avzqI3qzwdczs5LmeI2PjElQf9+lGY5dP4vQaMNc4pY3
	X/a7H+pFHvLjytoEfsKw155hDidT0/+nwNOcwgKR9vXVtnpMxCkgp6xhFsCRSOkq
	aiCCeeSahz3Opg+5lNBDGw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057r22h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 15:50:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OFQbJg010451
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 15:50:18 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010034.outbound.protection.outlook.com [52.101.193.34])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc0vhg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 15:50:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF01m24HZVlvE5EBH1u30xgiiJBCZ7CGNZwGXcrXVSqLn9d9hMbJB9phVixfVHKvdcwrp+iIh4V8o+bmwjoTikPecLeA94c6xDQrB4r5RNv5wE2WK6742O4ORIm8795xGmZhxcXMfXKHyha81Jr/zJsXrVDfEa/XboelAd0lJtAFmmqAq7LzXwWzB61XyRFdPscnSeq9EHpJT1mmbp9ZLUg5XPfX11Ft9oA5mxtownhHdKY8cBTQ0BsNvz/XOzq9+Z7DOMsFGuMz0JLLRy0Tn220NFOlN9oHNx2P8M6wGcMT1T4ZuTp+d+Qk6i4DA3yBdZ5i2gVvt2QSHlWKpONT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljv9VSaX4CcYK0eTEmIf/E9d9fBOdieyC6gUGTcD7rY=;
 b=MKU8sxkjpHxipZ/MoU0WviuEBaBYpr/2Gl7ooRkUIIq403HZneKpVQGHeIpLpGd0VCeNyLedAnUWEI63492j4n0InRNBqCeyrGh3tfmvlUGsMg554NcMiuANi8euiKS0LG54Z5kIbVRori8LgfnP3UVp1KWsYd6ovaQ4JKzb9qLl9J4JvMtH4LMCVsbMnzTuAlhr/SvfSITnMDl0x9nKM0PzOCNOt/tAyji+Cw0kpYHOGZSY/US9xo8vlyBEptTCviUgmDahsSaJ6Y1u9ibni4OA3tnEHmbYumxHRe/KzpcSifrXNdFUIJXZYZgzqRVxL9D776/4v0gExg2xfce4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljv9VSaX4CcYK0eTEmIf/E9d9fBOdieyC6gUGTcD7rY=;
 b=C8X3hyKzwlK04RAf4p43JOojqMtIOwAIz6UPDtPkhjfvIeN8t+yPEcrIKMIx0nHdH9heVsYz2f69hC1DypTacgWUcT8BzbjHkJfGh8sBLOD5GgyyT/c5xLuEWO49Fs2y8nUgtY7HYP4y8eARrqhkd2tsbU4s54H/4bGy2asQG98=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB5159.namprd10.prod.outlook.com (2603:10b6:408:116::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Thu, 24 Jul
 2025 15:50:15 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 15:50:15 +0000
Date: Thu, 24 Jul 2025 11:50:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] demo: remove demo script depending on non-Linux OS features
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672ADE9E7B4B3BDAB17A3B0C25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 51e62648-6346-4b04-fe17-08ddcac9c81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hrTRwTnyi8pIO/jyyyTLeR2aSbkPBDL0dqIYIKGbA7nPQFE1/c7lEbl0QLU3?=
 =?us-ascii?Q?Tw64qrBywkj+TrM+QE73JG7XRRvRRznYyFY1JosdVQplCwx5wGB4fI7yRNdo?=
 =?us-ascii?Q?NncgLMH8QJnVHOfivGwKkeZXXpq0gpYhZe9FrNN59vSkjB3YfWaG05xrEGA1?=
 =?us-ascii?Q?WugM1Ou/jyn3R5ozjDsnB6QjJByrMtRdMx+iksg0+LrCy95DQUgMr8290kC8?=
 =?us-ascii?Q?fuBdyXYGOa40XqmTrtFTOE27De/av5MNAPFgq6YxmHMGf7oaP4cbaBiYWP1o?=
 =?us-ascii?Q?fskYM+qZjftPDZSxRKRylth41Qc5jNqGGNlonU25oljrKsDwocUO3yWVbOTb?=
 =?us-ascii?Q?6KexAHZfm1oQ8ikXwH1nhPefdgtS+mHRDHIg2iEBCzv7cYVVMsOYMRhjg5VF?=
 =?us-ascii?Q?ZIZLPqqWXQsZExkpXTc+0igeoZZ9bcbY4z+hQ5sFP+6J5HJ8dyzmtVEZ9Fx3?=
 =?us-ascii?Q?1lCEVnbm9sEHKLCZcIhMc7CeDhRUki0lauFoogmum1WfeHGkm2kdEh/PjL9M?=
 =?us-ascii?Q?qWuxaISpfCyWHVS3zEfIDBPl1wWMHEtO1aXoPQS1q7LECQeCheKi96SJRmk0?=
 =?us-ascii?Q?nIBb8LfJepKm0PcOm27eyw7VxksDJQhGgbfX9FCdHANbIVEgUcFoKfUusCQT?=
 =?us-ascii?Q?G9ytnA4o9EKxIfIyl5DXwTlhDYm6w1i+HS61QsgAE04RCGQ6kQN7J8fm9obI?=
 =?us-ascii?Q?M+UNAxF6M/ClMiiDpX2NGKfB7/jDe1mxnsETo8ZZ2P4ZShQ+bvuuy3wbu+Ss?=
 =?us-ascii?Q?D1C8BDbeYf6uyhN1KGRBoufEOGp3ZcE/nId47TvFmOI6wddO9yaO7oevTUYw?=
 =?us-ascii?Q?dRffvj6g5gRZQLI6RF1RvOVcsw/GgDMjYKW9fDMUWLwJ/a4yEKmuuufZgSp4?=
 =?us-ascii?Q?6W/mtNQRc6X9z8XdEeJt9wF93XJagbhViDPmF4cRA/rmX1kPcc4YfinZRFrk?=
 =?us-ascii?Q?SnuKH8fA1I2PU1p1kSU4GZu8BrfM2MFfT+XgCk7ea3dHU2N0Ym46rlE5t0/G?=
 =?us-ascii?Q?2jNsytyM0OxbKnWxNOV8bSnlCkc4Omy3+A7t4neuK6DvUBv/QmSBJmw5fQ2y?=
 =?us-ascii?Q?FiUi+nl0zB0OQtPydn5BNh36/ShGJVsgktZTgAkjQsY4fu3Hf45WmF0+oo48?=
 =?us-ascii?Q?CYdrEHXS6AKfqj5+ZCcv2xu5RNfnKUWQ8F/DhkEHtz3qQxsWNzR1uIQLoFiA?=
 =?us-ascii?Q?UvpBIizRPnC6UR1vocKzDj3mu6CEsvSwJhjlgQtDkcdyOWLeSiPyJR1xcBpD?=
 =?us-ascii?Q?Tmx3hbj5obod6xA4+dm+soJ21eSWF1cKf43/ryo8q60XOA0UJmHayV1VEE6u?=
 =?us-ascii?Q?E4IMpA9rYlgAUs6pFP57EoYSCUrOU8JYcbDboGtv5thGQDHE5marZM0/F5A5?=
 =?us-ascii?Q?WsMaCdh7XxGGAuQBY33VYwJD9Y56Rdg7exp3xqZTjoXoRRL+QSKVxXPKUmZ1?=
 =?us-ascii?Q?9ut9s4+AzfQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6jK0gZsdMPyXwp4oISpFdIW9IwfuG/ha82zsBxzLA5NQy6rVtQlbhfD12ts?=
 =?us-ascii?Q?XqY2BripSMb0dUlFcmeC4g7MqWsGVkCbsQr3hmSv8TUEp0+HUO8n4LfSZOe3?=
 =?us-ascii?Q?ciLj2y7y/1dhMotoPHdniX1z+wzbxlEKK8KnliOeEyD7NY6zaVJmN3tz/OCW?=
 =?us-ascii?Q?hTfykExCruTPCN9JWO+tmF6dm7S911rYvoNo0DeMILZso7fCtLbUVT46K1bK?=
 =?us-ascii?Q?l0MamuxojgVaRWh7arRGcSuJtbuiBLDlnyvasS/VXpNovEyV83hG9jie4grm?=
 =?us-ascii?Q?AiZ6NDFrFG35n4rP9aQkIrbtvSLy0a+k1f2t61j+exrUaBMmDhcTbxKop2za?=
 =?us-ascii?Q?dRQAJxrOm9p1niEMKvjeVk3SMJgvAgpreQEUQDFf844zeuZs8X0fu338nBsh?=
 =?us-ascii?Q?QvNKcZfBPP+bC/Nlq7MnBbxYAV7kMHUbUua/RDFZJ334kiVYW/oDhs8BR4ag?=
 =?us-ascii?Q?J79uUVueWE6EitcgmtzcKxW+w5d1ujIxCPBv92lKy+S8y+WaLqzzx7LWOy0v?=
 =?us-ascii?Q?dbryVw+WC9mg+geFvsXTCe7RJlxLuVXw7e6VRkLdM6E4bhMg5Ca4YsBAU7Y7?=
 =?us-ascii?Q?Dv8X/UsKEqY3bcd7CFDEVOXUNFsBcuCFUUEIH3e0k6rgqsriijMr64JVnadP?=
 =?us-ascii?Q?zSudBEMvRC06bvWQVz9EDtFCPDO7h2VU6eKSlE7znmybNnXFQXn7ul94G60e?=
 =?us-ascii?Q?8hmdSP8MAQnqkPvS13qYZiKt0Methq3I11UCkHNplsonGN8AR9LH/5O4K0wi?=
 =?us-ascii?Q?JALObzFGxyw+4qz3wk2VHrJqxdzGPg4wNltRyWkDw02xSsvPohjHowAbZSGH?=
 =?us-ascii?Q?mCJXcXfxLPYQRIXN9DrEh79LLAvosVspH8LlH3JpM9h3gqiP97lcSgEwX+k8?=
 =?us-ascii?Q?SO9bVpTXV1zhKyWat5apsfXYq1YD0ct9tGggHbHcGF1MVNwRXHxSRHIbHgMx?=
 =?us-ascii?Q?TC0PZor+UgQvVWe6WSJBrhI6KjNhrA8LBsb687i7ymevTiuTNuNV0C0WReag?=
 =?us-ascii?Q?7jYM0adx2aNpKJSvHbBmCwNCBbIOuhmboLAHQx3J7hjaoKZlPSFQ8nxuFWVF?=
 =?us-ascii?Q?uqqfehLZD4x/MCkmEW0lLStfpMfziHnzpSDwUrPRa+9tM2ga+FE6eKa0cyaL?=
 =?us-ascii?Q?CRsnuzQL2VhCywSKClcUPDwaqhJtWEEdNc4SKePZmCmrzce5f9IZ9FIJg/mC?=
 =?us-ascii?Q?Wv4X65QDSYErxWfYQjJoTlyvVfhdoQvtRGTUyrUsXK9nfO/VO2fUeMqDIb2Q?=
 =?us-ascii?Q?geuuSldmwNXdfv871Xd+MEwrY3oK45KYJqCWSH8iWB4ftRGjyE51FN+vSmG2?=
 =?us-ascii?Q?juJEHBxzp5ZtB2kerxVrxZLlhxF0eVivPNKYUMI3pKMQg4rfh6pcsDf94OTo?=
 =?us-ascii?Q?0XiEzTbv8m30u/paFif/yXs62eoiHIg94VUDZim/q5C/xW3XffYkhV0HmorN?=
 =?us-ascii?Q?ijNH6UiDJxngxlM7K3P0KSlvG9rPEcfOgb+jpxRT023mjLnEy1kwW6fwCSr6?=
 =?us-ascii?Q?FvsS+nu8eBr+yg0+rzk8JSnk6bv06SqbBQ35xrnhfo5Zg4yMbgTRwLNb+8vK?=
 =?us-ascii?Q?E2RU7SkKwp0Al6DCwaChJWOgDHx+dQ5TshjX2k5vV1WwkafCXRXUmTtm6OQV?=
 =?us-ascii?Q?vQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MTdprxPKNUjo6gf9ZFQnnqxgKiI3AmwBfIzksVcYnnz4OGEYF/uv6ys+KoUGn84SMOIT3o0Mtji575357LwOjnNtSG4rEM5RHNMHRo1QexjVrnOlCjUPqEDdte7XoYB45AA6IPQwxQLz9//UwUT88Sxd/mmPhK0y4AVHFy0nHty2MalGj3CXqiHNwZXdxm69l+oVdsaf4m4CL+6bATuqcfsYCGWBYuSdExiyHgtOcDmDcUzbIsNFY9Dzz2MRkskFR4RF+RrT+NnnSTFWeXxMzsPsKQimbz9h8G+4ccBGkSq0mQId1DwMVY5QgldgACe2MPqvIFh9sHfu5YB9gGwYEQmk4PS52NwUmyPjo6wNYkHvlkL+nK6FVVxm7Mt9hvpppaG3jeqCdPC5GX4fXaOwr9kbbDJM6LsBAk7vBXIU8xq+MVreyhjjcmkxwIRvn34q4A4G2tODd6SteXkcqCPoUY29L+EkCCz11Ph9JzjXSeHDKeSkwDnibnts72mnIiduoFMI7VdVOz0o2RcAqEXghk3gCenF65ixkNUM65RDHDirwiS+ROjuCfP/VlnOY+ZSRG6UegS5vJM7GoSaC/KsRYGbXtICzEhMykDaOGrXy6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e62648-6346-4b04-fe17-08ddcac9c81a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 15:50:15.2746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tohABbWALa76FX8abA3SCAQs2naiNq9usPDlK4tqmz2lf6PouF+27jCJD+td6KjB1kkZK+Z7kFwH/Sn4yxspFUOVmCafdat8lYaTreze/G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507240120
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=6882563b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=HQNwY10kadmWfUDxgagA:9
X-Proofpoint-ORIG-GUID: XLpEwOvgfdJLGUFfzUy9jNg2HA_5KUON
X-Proofpoint-GUID: XLpEwOvgfdJLGUFfzUy9jNg2HA_5KUON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEyMCBTYWx0ZWRfX6YEVeKy5+Amb
 RLujKh1/+zxFoo0pi5H7HCkErOPsnwkrN6UIfAH859z1/xPv1Y74VEZ1z0M/t+0iv9Q5oZu7duM
 RTS+P8yjx+TWVnLFqFiy08ykAXuJ9mzRP73dwbBLE6G05p8jIO8TMtiThG5PWvfc+EihVfWiH3p
 wgKHsjaT2hFcYItNi8EBZNdkS5EIs0zr7oLwyicSGlKD/cN5MR8SxZp1KSQorfo6JRKE8B6yf1I
 1639h6/HRw4D+yzCn82Cv2KOAmLieFjs9/Aq57V9glOh1a2S03/huf75deuqtahid7ggLIwQWmv
 tp4BlJbqgrBUARi9on74WI9UVqUy/WNGV7HR6U+HNRMoUWsstbJvzfYkixfmASh6vgvacUIz8Sd
 ndZbKm0XA5nFzQKN2NypnjLqo0jyFD0sKDZaijclROiKr8Oc71dgdRORzZgCZoXX3H7C1b9M

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/struct/kstat.d | 29 -----------------------------
 test/demo/struct/kstat.t |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 test/demo/struct/kstat.d
 delete mode 120000 test/demo/struct/kstat.t

diff --git a/test/demo/struct/kstat.d b/test/demo/struct/kstat.d
deleted file mode 100644
index 1ccc3bb4..00000000
--- a/test/demo/struct/kstat.d
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2005, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/* @@runtest-opts: -q $_pid */
-/* @@xfail: userspace tracing not implemented */
-/* @@skip: solaris-specific, not yet converted */
-
-pid$1:libkstat:kstat_data_lookup:entry
-{
-	self->ksname = arg1;
-}
-
-pid$1:libkstat:kstat_data_lookup:return
-/self->ksname != NULL && arg1 != NULL/
-{
-	this->ksp = (kstat_named_t *)copyin(arg1, sizeof(kstat_named_t));
-	printf("%s has ui64 value %u\n",
-	    copyinstr(self->ksname), this->ksp->value.ui64);
-}
-
-pid$1:libkstat:kstat_data_lookup:return
-/self->ksname != NULL && arg1 == NULL/
-{
-	self->ksname = NULL;
-}
diff --git a/test/demo/struct/kstat.t b/test/demo/struct/kstat.t
deleted file mode 120000
index e9f7e5b7..00000000
--- a/test/demo/struct/kstat.t
+++ /dev/null
@@ -1 +0,0 @@
-/usr/bin/mpstat
\ No newline at end of file
-- 
2.45.2

