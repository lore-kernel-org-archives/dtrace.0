Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295B230D15
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737069265; cv=fail; b=duz/xeSU8ys+3VkOC+Ng90kkZpEDu9qQZfJvmZrqmeag470p5XmMjiCFX340AeHKmcUYH3PMknELVPLWSBxHgBnDR8FqDDIACxQAlmnk3J0JPPwQdSOIUQYqY2EYVEASGVgcDXIp5RVpwuk1lnOrHXEf60xBdjTnCg4iEUA1u7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737069265; c=relaxed/simple;
	bh=UocxoCdN2sCHBWztuO5q4+WOrbmQIsuQ3OBlkXM8GtE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JDPohiFSD6jGcMOin8F0D80xSnPVoygbJaKNC219AK+xfkk8ogeVhnH0G9WXmhMpfq8rYKPab4sdFoiwNFHzE8NYjSRpDbY8sPjqnErQWJgryGZJoLdu8KvD9F71LD31Q9IhYMijGtZNC8nXX/c8kk5YCXkw9gTm8hasfZ8tREk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WK8is/Qn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wHvnJFCK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WK8is/Qn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wHvnJFCK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GMBoFe031407
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 23:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=wjLme0ZMkIxeTRSzu3+2H72EQzzQg0jcfgs8vV3D+aA=; b=
	WK8is/Qn2Ha8hJ7CWa3S1WuehZGA9z/tMS/AUKLxpbspFeipfOmTUIStBkuQzFlN
	PT7l/+rorzOFPkg9V+UKKwG+rcCiexbdeArQlc2z/Y0yhgWPHMTH3Z6k50PGNOi7
	r1pJCwiSCUoW+eaOQ5CIwZfu+G+zP0g+f0Duz31RZpgzhRPh/FQYxqBF9GjuME4v
	Wc+K/xrTWrdm4dNtManNWIUdmYxlEZmKzSnAIotV1yGDVci3aCeVjvpEsKc6jcCo
	CeLwqHN6dOQ+GwfOmN6r+oaNTzdfHCI9LgFZbZgGaAGhkAMJp+NNB1elCYYyejTh
	rpr7+4Dj27j9KW7qIEDNCg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446pdx29s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 23:14:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GMK4CI020367
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 23:14:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3htw76-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 23:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NB9J/vF7SF/B9BVjeAplVaZ5cZi67/uURDMMgxazXL4ECOFAybQU6WogTp1yt0qVIFZTaCQQ3SNCDAjeyIzX+7c86rWkUaV+dq0QgciqGOBaltxaJVfle2BOWd8RSMv1cMEEPNLn84Gj2P3pG4z3JTZLHttrC3cKNqLB7VFnb5p12TkjYm/xCIz16tHzAa08+9dWt8fBPAF5/ypFO70jxEjg4ZKoxkch3hVM+iwK35+7uxWpA1KT6A/ZlhVYb5Phf/FNJjJvXtLwqYZhwNS1/8OcrkpXa45UIEJ+Qz6fT73JuUoHaapDsWVQL70cIszsDBFTKsOMNUn2tG+A8uOeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjLme0ZMkIxeTRSzu3+2H72EQzzQg0jcfgs8vV3D+aA=;
 b=BhJB1bki4pK2bCsSf0Y81Xy9nCpyJn1KC7quJD/D9nTbZpzOie98gtb9DNAth9dhRfj6kDdd6DcjdUW4h5irOCdOht2hQNZjUT28KAtwfUnDpIlONQRIyOuNxZyH3YJY0GL1iCWyr21I8kXJEGDWI+KfvdrVsYNy8M+rlPbVemqDJBRrmYeJ3Yc6LBMQIQANmzrEcYl6892a8SmiELa4uZQwl3gLwiol98hlGFCNdy7QwGjY6NOPPiNwDBUVNRHMF3fZaLpQFWo4d67YH7vFpMXYl3FAkFqGnPPy6H4ygS6UF8Mc360MVrPeZ05ea+mU1sr38nbStYR6c99SjJTP3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjLme0ZMkIxeTRSzu3+2H72EQzzQg0jcfgs8vV3D+aA=;
 b=wHvnJFCKTZ+2VVMVCrtp4Id10PG7tiZ9FzAwXfDW48y2wSkNwJMJVyXlmiP5WT6b3CBYeCMrbs4RNQQcYX1hqaQgYsiSS1QEvUhK1sos1GpiK9ifbJFrBpg73mh94+wyttRfx0yTsnfUwWVtbwJ8na09Jcbxc0io7Ui2oFd+QMo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7773.namprd10.prod.outlook.com (2603:10b6:408:1e6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:14:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 23:14:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Fix trampoline use of BPF stack for scratch
Date: Thu, 16 Jan 2025 18:14:14 -0500
Message-Id: <20250116231414.32553-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:408:f6::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 21243763-0a6d-445f-b696-08dd36838035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h29FBQlqEZodxEBZJTCr0g2FXtSiv6VeqGgss5osPiOgYLJ7ciDAAiGbIiDz?=
 =?us-ascii?Q?4ZEJShmwLg93VO79x2Vq6JpBfOpcmnzBy1Pi3mqUDCZi2W6HC1qzKJy/JhLz?=
 =?us-ascii?Q?M6Hk47Vh/s5cyNQQrALZEsEaDi/neBVtGd6hX6yzT1h+3+53NQ2h0WLGo+sS?=
 =?us-ascii?Q?nrASVI57S2qwYa1ofEaFo2vIIZIgMqQmtyZapdFi1Go8YbbT7KbrClss16SF?=
 =?us-ascii?Q?RdH3GgitwUhEvtUgJsYPNInWk/ru6icP3GrC++JPQvCFB8pvVn/X3mav+Fzz?=
 =?us-ascii?Q?UcdZbpevp8sfbV+lCRsDkjaIpbbe0lXUb9VTMFeN+NCypGXQRqhwnS1RGFLq?=
 =?us-ascii?Q?apsieghmR+3r2Me/aVMocSNZLaGc+NSyH3JnZY8bRtAGSWbyICwf2vP7KEbx?=
 =?us-ascii?Q?+jbacSJoQ9FT14Fv2uI1UFK+yrRhDwOx0erCDiC9Wp5vA/zJEV9q4GWkvdWn?=
 =?us-ascii?Q?Sfc00xtDHqnLPO9GTtVKSpoep11CZy6mmjgl8JqtXrxoUzTqbtsEYfW3UOL2?=
 =?us-ascii?Q?pZQIQWVZq2lKK/BaMtuonzpTAzrI52jZTwJKcDyUaeCPUONIhwE29krkn+Jy?=
 =?us-ascii?Q?K1xi1vHFLmXpZEzplEwIF16SFIETfmPyVRd12cSzXyHe2IG/2cqMfJN5705p?=
 =?us-ascii?Q?vrJxP3fH8Hd9IUVADJElRo+SdqBXq+i95vALRKDi4zPzi5DN7JHOl9LRzP8q?=
 =?us-ascii?Q?/i3TC4fXeZHQ9qcTxfekuPKxAk3IzjpOaTPHt8DUBzR9rKemyBzTN3eGZ12L?=
 =?us-ascii?Q?jYIhFXLhc+xQu0SNsU+UBiOIHn+CGrrTdhTEEXtkOviPtg4fkIV5/Fe4Aozi?=
 =?us-ascii?Q?qjAvGeyIwcENWlYbkY2Mn7pr8LyLZYczKB6eliH3q6ZBYA81KM8QgV+ZJml+?=
 =?us-ascii?Q?Djd3ggBRYoma+CEy3NU2aRHmIOqQKeQAQJOsDzuSt1FH7ssofXw7/7+KmRrh?=
 =?us-ascii?Q?hvsC4Lso1KA4je7pV3fPTWVzNy790yqfdOCJ5K1aNRNnyV40uvPE5ixTL8CU?=
 =?us-ascii?Q?hl6TWwj3EVTXqYK9jAWZ3DH53NaSl7ek8ZOItpl6aaGVZ5pfId0ILX6MnG2A?=
 =?us-ascii?Q?cJwbp96PrCAj6LKOBh8so5hBL7Jg/ZQ6GPC45xoHe0vIeoF/Z3ZWZgkLZzey?=
 =?us-ascii?Q?EDBRp5hW3N5zKzlfHhoG1AS0+nfa0NRqetQUitHhyotSaMJEzzLHe427unHw?=
 =?us-ascii?Q?ieBO1fVu2wZS2ykyrAiC9dItBahPbDp/oot1au1AhubZ9hRTc8x6mAkLQFZY?=
 =?us-ascii?Q?aTAv8kbTd9ClyOe+h01VK27hAC6fsRbO8Tt+2FOJSK02heG+dUIcWJwfhqEz?=
 =?us-ascii?Q?/Ei+pFOvWKsLQVCZ7wRDXlVuA2LQpTCfbhiYom1Pe2R7UQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ius7c6BGWptT+owatuC57xzYC8HYj0CvrRnbAIwNPm7fkdjtfaf9zNHsSaIl?=
 =?us-ascii?Q?HEYxMqnFuN7ZWhtVTUM4Fv7mNQKtqX/EM3zC6odVILzJCLHGqsoc+GppeALt?=
 =?us-ascii?Q?7F60TVxelq6XXszlP37Y0dtxfECqp5HRysHqzg8XfYKtuuRN/l5WbYdbIcJO?=
 =?us-ascii?Q?jtLHMDG6b2CtfbA26uppycxZ0W/vlAb81mCCJcVHCnxmuTSdUloDnoTYVCTs?=
 =?us-ascii?Q?QZj5OunziZa6S8F2mPTanbCijpb+9qi7EjwB7HZdq35b8udBIf7On/co7r3G?=
 =?us-ascii?Q?4DUTpENCqalk5bVBdxvjDq9qxeq+MIrbtMLuV65vU6/P6PpnEx0DD4fAJDVe?=
 =?us-ascii?Q?slR7NVcbfpZVqrspXKJ7QHeIoZ6Gr8NLGLuqbtD9lDbcVbzNybXj5OCPW6lC?=
 =?us-ascii?Q?rxGvQPz8f22sHhlCL+V6piRT9rySsRi/coxDOROKUL1FgWUL7FvHMl1s0I5M?=
 =?us-ascii?Q?ITj6XfBne7H01gZqSpBI9+gwM0s25Lby3fBJiWiB/V7mVHZSz7+2N8THZrof?=
 =?us-ascii?Q?2Qs6cDOK4XSPssfGJiOqeoqxmp8UoW0zNhI/uguNoyn8VDmGD0lCy6MLcCBS?=
 =?us-ascii?Q?LFDiw1nSN1dIIi4cG9xXA9sCKAsN5d+i6cv27M82uFFXKunZ6Vc7LVQTLgTa?=
 =?us-ascii?Q?qdr31w752DDhXEBGuIZiQuaymEbe9rJdpQe7XgWznlaYnJ9Q8fv6lnQD0Rbx?=
 =?us-ascii?Q?kD7GbIYk/hJCdExTLGXr4F1GsjeDcALGpDB0xeGlQfrhgj/9pPPgR7ZDiW1S?=
 =?us-ascii?Q?hBHE5EMCCeKNNvE5TimagZD5ogRuSt6lnTygxBUqIeJqF/26VAQtOB8r8pXC?=
 =?us-ascii?Q?pw0J9I+WfLDf6UUqGjq/vUE4bxTgFEkj4vSyo3I22bevFqMKSi9KWZxuh2Ky?=
 =?us-ascii?Q?wXGoZfaZFpOnGVZJqFGnr7ZEbtAMAAcp9f45Mbz0ssjq+4M9x2CubbACt1R0?=
 =?us-ascii?Q?cCDYQq+B7Gvvc3CP0W00D3EZJprqNKoQa5cHsRfxDAsWR6Az79g1vzOcTOgc?=
 =?us-ascii?Q?MP6xYNiYNen2qLjsaKEskkJJsW6ulzxwKvh18XsA5ClMCxI5wtcSdTTgIHfr?=
 =?us-ascii?Q?C6ke8ZaOEt+FQ5rNdvqliNtjY5gEa4dqucXlLFjkhAxTBWSokiAxsWG9Jzyn?=
 =?us-ascii?Q?kdGCx3zHMi4PMhya9mYE+dj+fN+Ra1XM8JcW8JYjQmIbihD7g/0/6EJrcjFb?=
 =?us-ascii?Q?I4TZluqkEYdO+tlf+4947Wy+SLa+I7fXq6PPJchkQFC57fYK9ze/rbnGO29G?=
 =?us-ascii?Q?Bs4OIV8nljFvR0yAFbExjLg4dzS8r+zkqS8n+6dTQGquTMrvDwQcT/PuCxPM?=
 =?us-ascii?Q?rxemelQ3cqiGen/MnjksitsOG6/c7waM5vheebnzFXznZMlftHe01TMKi95l?=
 =?us-ascii?Q?0Tn2Ce1XKTct93TMt4mKXj4umlhdqmI8YSqit6AvkU3O6hr6sP1VIHrddydU?=
 =?us-ascii?Q?0wQa1ujz/X/oEE7rbBVm8AtbFdKFs0jf50LvAGM87IRPZWxKB51ksohAEjlL?=
 =?us-ascii?Q?qW19H50b0x+UvH2qMDl2cuYdQspGxscPCx5ZCRKXK3gB5nnKSi9JOOZE2RTV?=
 =?us-ascii?Q?jemeX31wxLAVY9zzix4rg/K7Xa70TDjuy4s/EtfD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J38WknYiE+PJEKlz/7AmBcilDhocX3E0shfxWBctbgz4VYuEqBt40kSAX3Fxn/UFRw3y8l63x4kSzFweAPSsZZ+bsqNvJWoqFxJQHSLcG2xXZDyHil1WrUSjyEB+QqYtMvOWwiY6XMH8FOjABYsr+ag3Kp2E+4e8q5n90wAd5z+JeugFFVArCIC/y+8kfnrjjxpcWrW4sFh9TZ1PEYhVk2GLaviLPuqu8TVS48Aqup+NcDbZq3Cln7IeDSk0YGXOfZ9DLI+wlxYhZdQFqMPWTTwYdB7b6MEfad56aZo1y1f52G3VlX9d3QNTfVeZW2GOleoMbEBFjvLUTeZx9H3ni3+L/Ab5SQ9k8go011wsUu7SmWc8HxHvg//M9UQyApYeivXFbQScTKXxKmQ07YNUpgKDO5MRurcV5edpXoFfNb6tmXSUon8ysoXuYtmGWq5opOtYrMOZhBBPZHAGZnLs8Cq2+w0ofN5lV8ox9eM9lQstlzfHRQOACu6bBb6AkSDrnXZ7lP8qS+zrcmZKnvvEEAGumy7UiJiIjIda+SasfkdagZGb3hIaEzbaMTWRl5sRJquax5aGURVIggiEom1S51tfQJ3+pNMLIw5W7SMuNiY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21243763-0a6d-445f-b696-08dd36838035
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 23:14:17.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARrAIaLnNBH9WH04cWVBdmzhBLjViDxhx/RZboTl5QpRkMkZjq3I4zdYoxEdaOpd4icT9PJZxeQv1TASG5S/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7773
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160172
X-Proofpoint-GUID: gIyHUeYvjYQjKLHA5DHvfsWBwZSOSxPh
X-Proofpoint-ORIG-GUID: gIyHUeYvjYQjKLHA5DHvfsWBwZSOSxPh

From: Eugene Loh <eugene.loh@oracle.com>

The trampoline starts by setting %r9 = %fp + -DCTX_SIZE -- that is,
%r9 = %fp - 88.  Then, it fills the BPF stack from %fp-88 to %fp with
the various dctx-> pointers.  Calls to clauses will reset %fp.

The proc provider's trampoline was using the BPF stack for scratch
space for the exit and signal-handle probes.  Specifically, it used
%fp + DT_STK_SPILL(0), which overwrites a dctx-> pointer.

Switch to DT_TRAMP_SP_SLOT(0), which is intended for this purpose.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_proc.c                         | 14 +++++++-------
 test/unittest/lquantize/tst.32bit-bug26268136.sh |  1 -
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index 0223c5d18..9fc499aeb 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -62,7 +62,7 @@ static const char		modname[] = "vmlinux";
  * The dependent probe support should include a priority specification to drive
  * the order in which dependent probes are added to the underlying probe.  This
  * is needed to enforce specific probe firing semantics (e.g. proc:::start must
- * always precede [roc:::lwp-start).
+ * always precede proc:::lwp-start).
  */
 
 typedef struct probe_arg {
@@ -350,12 +350,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 *	else args[0] = 2;			// CLD_KILLED
 		 */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, sizeof(int)));
 		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
 		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_0, 1));
 		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_1));
 		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_2, 0x7f));
@@ -406,17 +406,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, 0);
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_keep));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
index d5f143f58..a360fd17e 100755
--- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
+++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

