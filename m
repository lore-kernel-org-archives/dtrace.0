Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9942E1A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466773; cv=fail; b=Ng4mXA1Ds89d3T9wLj9MtXZgOqmn6vmrIPpQ124bNvKJyVUDSvwRijiXMcGupZQmuzj5jGAvKaduyqnrIrFKgujxIQKrk8XJIGDgx73w16LdZ92MUC1BECfQw6nbt0nNA+e9SS5/GZzsI7Y/aR1flndMsoQC+TzOQ8wCt3EKjRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466773; c=relaxed/simple;
	bh=LgjvlCAFhBdxPp85YiELLW19LjqjbzPG+5NaW6gCY9c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OdKdvfmiF7mycAPfRvDC0zEy5ovBChcVIZlfEi+PqlPkq+PZLzRUZmaCQQXe2Hym+Y/VuoQlaUofid94stBGk2QoVFaaMzbzz68y808npPkrwWACHld3THs5TFsc0h5XcYbs1VRjuwBEFdpXjEzkC2rz58+RHFobDfhc4vwAZak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R7w1BXwq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lNhrYKDn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R7w1BXwq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lNhrYKDn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMslN031036
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=0T3beUTQD1rCXR
	KoDwhlmXqqHRTF3CBotGgoxL91iUc=; b=R7w1BXwqijx2hkrJmsIKa6BA+yA5Xw
	xwk2dihLnNMRVkSSMC0M1zWKZkD0VdAKpmvueDBkE2Y5aPmyk3vaIPUksaNor0oH
	Y0pD4txOkN7cvOph/m04nDjiWsWGGeEKdMhlwve6J8YSB7/WB3IlUPoFr8UAuIaD
	nMiqnX/27mu5ofghKPPlnV05FI7ij5ptxR/BNiDxb5pQV/0VuWfqOF8g1Yb3Gcny
	fC2fUVawPP4Xw09myP4Rywh0S7D/nGIvvgJA9TTmjqOFyOr//Nl+eCv2mpMu7Hji
	YuTAkcGL1FNgq8YgVQmhTprcw8q/sKU+wuMSi54+FaSsHKsHXyHn7Xfw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3FDXs037265
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2afhd8-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWmw6R6wjPkqmbRRunlUf3Hz6ZEy/CWvDCRsZFBu3XSNgpAOVpGsI1hlKAEptV2fuzzSS8pS4FGdMrWlPuomBHSfPtn/ghtf5BQEJ4lGEmF96VHGZwgEuAscimvUkDAt3bWxW1sPY49tvXyXEy3eLfwrjRj+DXV6r0Tkd0e9CcnQXUG9OsoSXAi6Vk1RwyrPdM/Kzo8vtlQ1NaBKUnCnKglpg7+ylZ2x3XRNb4VJ841oc8j6d8xJlNPeXa3M1qUWIqJUbWTLTJglSUXxV7hF9FVhCARfQ9WSiYr91gzoYP5heXJnuB9egFhvh+pLDIoWC4Ruj7ElVOJVPowwQYFggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T3beUTQD1rCXRKoDwhlmXqqHRTF3CBotGgoxL91iUc=;
 b=Mj+bTUXp0U9ImI4T22AuwJPCslF6d8mqBZE6QakXUJwAD+TkhHq2sovTMvV2N3AkiKHCLHVPxeslgco67QuOYNdrTeG4PRMCegwOSSalHPVgE+x+QdbQHEjtniCAcBcIEnUlBoP3UdeOsl3hEHSSDWbqp9IyGAkB+JsQ4/pKLDOd4ZpLggyn78ophUcknPtVnC3xn7VlLrUYeYx+PUi1jrdX1Kiw2FwZ8bRac1OvUc6s6sXNqHQH6TWjrvOCxy4z917RpTGFm+Fu6VAxFAabZBoSVg7/mNHSaAClgL1vvpTDV9/BhODRoz1WofapuZsqmoiaVrzzbapRPKefuKz2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T3beUTQD1rCXRKoDwhlmXqqHRTF3CBotGgoxL91iUc=;
 b=lNhrYKDnCMy/aukyv4Syi20eiI6CUb4umyUjCP11fyly02YhQ9Gl3lz4MvMyB+D7k+ve7rWRDldR3uX/5XT8peTqAiC/12L8wo16ZthH3SNnHW6ROPBkY/kByulBRLjwKth6F7bAMwXNIA7h3/5sX9vHJvy2w1m/Q9icbMtVdEo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 29/38] Allow relocation of the ERROR PRID
Date: Thu, 27 Jun 2024 01:38:55 -0400
Message-Id: <20240627053904.21996-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1547b7-3480-4c3c-6706-08dc966b8235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QdrIpNDmBw+pkLoZdcCBCR4IvM3S751V7dxdDtlgkNT517HZHGDyZcGaGb4L?=
 =?us-ascii?Q?J2nc5OhTy0iCUcxZP/hfJkZ83xeTaSvZjKOoBrtUpzI0aoZ/aMvO2q5sy6wI?=
 =?us-ascii?Q?W/GoBSNZUHUqnO5Xqbk/OADA42zYSJ4MF4MBiPt6Av2vZ5RdDs/mi+jPAXoK?=
 =?us-ascii?Q?QDKfW68dC3B0C6FDaWScR5WPrKSVF9xSfmwDmYQW+LFE0oe0tfKRaxvfkq+1?=
 =?us-ascii?Q?vDNMz5L0/pA+JIvf7bKtd8y++epsii6yaE6p6+V1LXneP0PFBIFDF9vC+SWI?=
 =?us-ascii?Q?runOhOfX7CObdY0z6uXFM7jqLGryWy9CJtLEl6Yk3cQiLn66kS0jat3E/D6h?=
 =?us-ascii?Q?VjjjId5BMwYwyiRAGUp4LlzNtiEIQiJ1CSpfW7/0rcVIbpdqo+66Aw7dJrCQ?=
 =?us-ascii?Q?UiwUg7cLcmZOxGHUsRUqzaHOxj4gBwqycxzg2DTnCOfbD+ORSLi3oW+Ow6em?=
 =?us-ascii?Q?6YPFhhDf40mZTHKU4hdXUsu+012BwyT9h+ykwqiI5slsnBJ4d/BrekHjYGtJ?=
 =?us-ascii?Q?/ZoKcCuwJ48qAaMXVGcROJOkW4UK4ZB3Zl3ZNyqEAqahqozAlkRGTzTszSVy?=
 =?us-ascii?Q?0U3OztojR8rVns86MLggyO7QfM1BKEzXv1iSikQwOWtdulFpysLa+uDzQh+C?=
 =?us-ascii?Q?OhNTjMSkcjcy+JB5/c5cIgev73GCom0WPAeBn6XoLx0QiAC/qI68zbyvEi8m?=
 =?us-ascii?Q?4Qh4ZLJYSP+7PkIUqOw/f2L2TeBa1xjtiOb7Jvhf+qkJJvMOHgOMYu4RSRKD?=
 =?us-ascii?Q?ejwXwcVCr3JIDiCtNZaExL4kMkB2BLrVLhv8bu3mlWlr+NLQ1ZdBQjB2AyYF?=
 =?us-ascii?Q?VVuVzQy8OfZK4SIF+9C64YFuEOoo7Wu5ID+pjEP+3v5YxZ2GitfFrBgYoNS4?=
 =?us-ascii?Q?tjN68FqyaJ1hNX8/KzlU3Dv8dTa2sREhzBizEqxGDKKtBxDapWW8Jzc0k1J7?=
 =?us-ascii?Q?cHCTe49D1TVMPqBT158G4kr9FvBN5ghYFZZUZAmJoUrew/P+vYcvVULU+8GO?=
 =?us-ascii?Q?+VX7TsZrt88jCTRS3NxxCwRLJGeaHvm2E18qrrhUMq6BrjXYOZrkUxRfCp32?=
 =?us-ascii?Q?Bucvrn8wGoE+uIoygdIxVs9sbrLktLfBJ9t8Z7o3bilHvYgt4eF7ELDkGtz2?=
 =?us-ascii?Q?4EgdNpOK37VEinti8RI9RWpwk+J3H4l1hIYP0SanJztN+PFY9bX502GbIvzE?=
 =?us-ascii?Q?o6z5T/klHOmwO+clglkpUhsaNmnebya6Xz6E48t+zxkW8EX9tptiL9IQYd0m?=
 =?us-ascii?Q?6ReBYwwbUTSOy1gg5gJjlCheue7kXKFZdHLY+Ww+LmM2RjcXKsH9yg3sqlM1?=
 =?us-ascii?Q?vDik6VJSx1lxd7V5SD9ob/dQ9QJtudrWqRQHyJOSosDmdw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1M9NoigwgpdpcAdIjdz/i+ZfDDqw6KkhGoIsI+Rj04YNJ1rKfUiM9vMM2KvY?=
 =?us-ascii?Q?/sEPNfkMLhUknADJhPSeLJ8Nbt+/UJSi23FoWHNOy5fxCTMRsgyQS3R5nRKE?=
 =?us-ascii?Q?R9tXU34z2+FIyF+ccMts/ZSscjfyoGbt0dLrxPPleXjzM9wbQNOICG8M1/C7?=
 =?us-ascii?Q?wcEIEMObS0pVkkVsAVabpI6DL2RpUPhCquNTCAdtrUeOjoWxKu4qsS/pECfT?=
 =?us-ascii?Q?naRMCVTcCRG6JRyd7WQCDZrhHYsBQv5qffkxNU1yWXShyf6nZvTnYOYgX65M?=
 =?us-ascii?Q?fEsjRLZ4YXA2lEoGJGMtW3NA4iJDYNJekFzLW4wnXEmSQ5B2WA1CYyWfA3fP?=
 =?us-ascii?Q?p+oojV5P6LIDz4BfhYT12iu4NVo5NOo6hzjgLADesRY98t6AwCv09uJwCQEa?=
 =?us-ascii?Q?uPBiTc4Acn8IRAoQYuSo2E1bsYRdZldcEki2o9D24tQuCgMiz5oN07rKTTc9?=
 =?us-ascii?Q?QzOQ5y4Xbhs+GzwbVLirf5IkBGZmtMiOkafkflW+wB3v+lOqbP2m0G2ePMX9?=
 =?us-ascii?Q?jgPmTrP/FbnkgIwWSbiIJ/3qsXyQjSUYTOeApAxfyPE/e0ydAaSnKInxoFga?=
 =?us-ascii?Q?MAP8vJSb+gvibUIv/qh8wntvGEMHJT18AJIHb/nNUsKU+NJplQ1b5FuxegJi?=
 =?us-ascii?Q?VW4k8PdALUc+HTvyayqCTOpbWhea6RAaUzHwWzvRgGdGQ7lMa63+V9Aa+OwN?=
 =?us-ascii?Q?lFYBsvnltyzwg4mzX1lojCtuvswQjktTF1/gybeV45RWgJ3hRRtHB/XjG1Ah?=
 =?us-ascii?Q?zngLfP2ItdSX/6dijeqoHCNyP1JWQ3JZA+Sc84sC9n7dIMLtzZzOyS5HEy0M?=
 =?us-ascii?Q?FJHPEpTuKlXFlQONJt+82AQWwULxFPe0Mb8b9jhgReAXHt7GHS6hv4l3b4LK?=
 =?us-ascii?Q?AUvQUpPh1cKBn4pPaTHw3cUuVIPz6TiIXIpuMxbLy+cpfTO8vX5TTZsRm14d?=
 =?us-ascii?Q?0XrUMyQpV10URffaE1tQHutYSg93fov8A2je3cXgq4oiUY/ozKJ80JhUUoTE?=
 =?us-ascii?Q?mEkCITgvZ7FJSquvSmjWGLr/Ov/D8LF0LX821w/NY+Hw9R2XzUlT0BtEexpX?=
 =?us-ascii?Q?OrwQNw6/M3Bi78wuenHAawZ202OEkU5LL5mOiJmgTWsirTAv0tCsR/JRxLtr?=
 =?us-ascii?Q?3MVInrhtMwkUXGDT/O6Hy2ZIiHE2zr/YgLELn+PcllPEcvC8mZ6uV4yIo4aA?=
 =?us-ascii?Q?nMVP6ePDmwDajxSIPMbthw/RNDCEdCqltsRvbJMAQaRES2VDyQj2YIDJZkvM?=
 =?us-ascii?Q?HDxajjas95TnMEQXy1Wh9urThC+zU3DUR0a+j1Coxw7DicacGnGFsAwz9olR?=
 =?us-ascii?Q?pmPvB7p7LCDs10IAe2mbJjTreWiv7TyWqJffx19hni8n6YBc2ohcU1SyMFpn?=
 =?us-ascii?Q?a1LShCxeQknDxdMKc4uMMS0YSOVIV3n+6YvO9n97RSWz2zy2SUfajqEpmDkM?=
 =?us-ascii?Q?v52BvrULbjtBv7YZ6EiKPdpiPuunC65XpjSZHCsadFNlHbrzTnQmNfH+m0Nd?=
 =?us-ascii?Q?mYRNTPl16UMq+yjtTlhgjyxoG26aNbS8dkPFtvdORsZ4oExynJgE843f/vWx?=
 =?us-ascii?Q?K8PouhTkHWlKbSUFREmf6i3Ziu7nXoKti1eaD+zT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	CStU27dhj8og3spCITx8NOcGXBpZ6DIhZZPtVYyrb7/VNZSslMI+KEJhi5hgfTfAgqB44nroUill8W4xXLcPiQGymJfPfXzmDrEfP7ERcVEflmoWjzbSkCTvQuYvtC9f98pngrOmBV8xXJZqPzbbt7ppHr3qn1PbzEtjAKta09U9uQtb9xpyMg9w988PIV30SeFm8kDPFo2CGsSU5EDprCJ5FOKKPOaqf/Kd/GW0ZE+dlqpSLOQZSEjQuMRc40HMluZgnUdQ38XCotF0F6cieFj5vLtjywSGQ6XoN/xIJN7bkiIoInd6dmhjedMh7IWBi3g7EUe0rSGhUulzNK8VuTYXr9J5Da0XWZ13E+SR9yD56R8nBQN0BHn4UiLDfCxY3YtsUxLc++LBdisoTaibeTWRq2Ym/gdUegAYulK8/WnF5PFMyGHVMgKUinNuu0kAloZOVRv0lXFIdcM4vfZPw06I3F8u2eH7CS3jCIvN7dZtSea7OI8sN17QWqUb/KNknO1hMx0gt7fMR/dFHqPF+SFFmV7iGMa41UGSsFz7PNITdrNeH1o+GUzAjI4XtrAL2jFBr9jdCKDN83tzBhidC0eTOOj0Bgo5md77jOQYDSo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1547b7-3480-4c3c-6706-08dc966b8235
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:27.1398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cSA0c33oeRIQJgPeUOdcnd6jqOiZUIzHa3lvs0JE/Pd3aX7/z2ZJRdyyxqOuIorh55tvY9Z84Qqww7JYN/QZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: d4t8Fq9Dwzk7n4v_u0VzNAx0HpdOlsRg
X-Proofpoint-ORIG-GUID: d4t8Fq9Dwzk7n4v_u0VzNAx0HpdOlsRg

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.h   | 1 +
 libdtrace/dt_cc.c    | 3 +++
 libdtrace/dt_dlibs.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5b2df264..58cf29cc 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -56,6 +56,7 @@ extern "C" {
 #define DT_CONST_ZERO_OFF		22
 #define DT_CONST_STACK_OFF		23
 #define DT_CONST_STACK_SKIP		24
+#define DT_CONST_ERROR_PRID		25
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d1ee3843..3d9a9c79 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1076,6 +1076,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = sizeof(uint64_t)
 				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
 				continue;
+			case DT_CONST_ERROR_PRID:
+				nrp->dofr_data = dtp->dt_error->desc->id;
+				continue;
 			case DT_CONST_BOOTTM:
 				if (boottime == 0 && get_boottime())
 					return -1;
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index bc883e11..1fb561ad 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -80,6 +80,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(STBSZ, DT_IDENT_SCALAR, DT_CONST_STBSZ),
 	DT_BPF_SYMBOL_ID(STRSZ, DT_IDENT_SCALAR, DT_CONST_STRSZ),
 	DT_BPF_SYMBOL_ID(STKSIZ, DT_IDENT_SCALAR, DT_CONST_STKSIZ),
+	DT_BPF_SYMBOL_ID(ERROR_PRID, DT_IDENT_SCALAR, DT_CONST_ERROR_PRID),
 	DT_BPF_SYMBOL_ID(BOOTTM, DT_IDENT_SCALAR, DT_CONST_BOOTTM),
 	DT_BPF_SYMBOL_ID(NSPEC, DT_IDENT_SCALAR, DT_CONST_NSPEC),
 	DT_BPF_SYMBOL_ID(NCPUS, DT_IDENT_SCALAR, DT_CONST_NCPUS),
-- 
2.18.4

