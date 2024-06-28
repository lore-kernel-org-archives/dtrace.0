Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81112B72
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540224; cv=fail; b=Sifo96ZoV70q7kNyPDdy62+RLsYEnOuXw/LADuaPOLFeS/I4vVfh4r5amoOSfAHOUD6vtsKR7HgEm+ArLpSZeO24zXsC+X4o238epfSxbXVlTXU++29V/MsSmBJ/t6x7nGXVkt0HkRVH/wWlfHj+ATlHPSI84h5H9ycWWXIX3/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540224; c=relaxed/simple;
	bh=mD5wl1YU9Obc6tlXlIcTUheDFGxpOUEGmz/uEhQ12S4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DLFjgO/WEJl+4mzPR4ZdY+19FU0wqhw/Qe9VhUHn6LjF6iL7YuulXhxikwBpGF5uTyHWJ+jAEhjRAadUeapGs7VRxmy3wW35Mks0wI2Xpqq8q6ut7Tz587f1xQoCOe2toEsBX6wKahDXOQeVvB28xiZlWonUwBYvljSyIZnQQrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A0eBqN3H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XgYZqNtc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A0eBqN3H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XgYZqNtc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBULX020448
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=EWRVrBn4nO0XyG
	W3J7sN3IZmMK42L0MyCFMFuHMdZkY=; b=A0eBqN3HsznJncmd8kfFRUEgxBn1kw
	OALzIK9YB3SV9ryCWgMetQUp0ic5swsvYW/SsAQ1GkfobgI+b9nEHK+d3m2RMPuW
	kasihz5NooNVb8GmjpPmIkmy8PUFUASmO4MawM/SJgUpqnRmfXB9wy6mfGEftX/x
	PNbRc/1QMRdMsTgfp0R2cYx8roMnZ2dLxWlIL1DdQ7AHUjd2C1zEBov3Uf8lZwXq
	iL3IQi4LCmrLppdKYeggeR36y6GhM16QkgF2ne25KTrtBCv7ibHb0VZapitnC9Vs
	yMLJvwmOj0f5kvNgawaUHmNHV1zbrextL7Ki7oysjw9Fqvr24X08fARQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywq5t7b6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45RNrDdU023336
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2hqvp0-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6P/k4uYs73Bwe/sMhxCVhpFgNe+HHVnVCCgPd7N2grhZhknSdhDPhjjWKAfFBOOhg5lL3yHxf5H2wV32srNw5eV5N4pxmKPyHhwO2hhc7u+nUyB+Jy9Nv3b20OtTVbVv+VttiOA04PxKdocfRxoJ29slsh+60HypZcr8USIT0+S53oCNZ5MVBV0r+3PYZ18hMGhWvi/WUdIYFmEzlisdY/0ACpWELDF+Isjx+dDZ0BLx9bJC20gyzo9nAYkpFp0fK9Z5Z6rRLwg5WviS0OluSqO7tUBXlaWBsdWoytnZWNfGiWFECud2EJ2VszTf8v6VgoqIoYAMfDWhTqrG9GUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EWRVrBn4nO0XyGW3J7sN3IZmMK42L0MyCFMFuHMdZkY=;
 b=Fnh4xl64ofxfCqIpHtV4ULQ/iLThGFI3wwmhTT0FU0XzB/CVDNnO27bpNxVO6O6NBYGoFvwgPvUUJrs4LzuYyu7z1G3szt9pcWTxYQA4cwj/zw19bW9atmqgzSB57C2hojSei1CFAtLdfDzpb25AfnNLr7O3R6gVE296WuR8y4SdXhLqbxz+Wo7HIUtLuVvCOVOdXhRK6msyrfu5fLtxtsbry2amNQNS1nJIP6lVfGuCu7F1mqtNQX5UsfmrfkWUXnGGy5UqVGQENL0BGw6i8mxMUXQArC4QeO4mLJMgx1Q3a4Aq6M9ObTkfuB21VO6N7GMmmpUUY54UA97INpQMMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EWRVrBn4nO0XyGW3J7sN3IZmMK42L0MyCFMFuHMdZkY=;
 b=XgYZqNtcyBQ5ZC3pXc3K5MRxaFcB+IN+wfNK4xI7/mlNqBkDWpyQf/ynJ7Xo1aLnqI0P+V/SAAWU7g25cDTQkPQ1I6R3j9bwJ/21+VY9vQrZuYakjWG6YFZY+3aCCoOUvbtNnho7INX87PZI2XXbCzqTeztgTvv+yIT/P1UVTJo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 02:03:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 02:03:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 36/38] Simplify trampoline_is_enabled()
Date: Thu, 27 Jun 2024 22:03:15 -0400
Message-Id: <20240628020316.32544-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240628020316.32544-1-eugene.loh@oracle.com>
References: <20240628020316.32544-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:a03:100::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb4b85f-93c2-49eb-373c-08dc97168040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iySmbNomuRjnNh0kKM+y8zHJjy9hqG+hJr94XRGwtnYRv0h9dLJja2WA72yt?=
 =?us-ascii?Q?3IODUFrKyWPMgAgaqqITv3rQYC1vA/fZorj0b3Jd20NTRgEtV6v/BMdJlLWO?=
 =?us-ascii?Q?Cip/FpEUUa2YKVIio/HFTe/kzPg5uCxMxaK+wABSaNxi6b5X58rxFkiF61Wc?=
 =?us-ascii?Q?amab38ort58SuJP8/5o8SAaf1nszld2QTu8CGgTDFXUZOJck00tniAF+YQsx?=
 =?us-ascii?Q?0nC0YGXxO4IdSiDbEfPK6OsvFizl9uc6muIj3XmJ4cThwGVFQ6fzKyS5Cvdc?=
 =?us-ascii?Q?TSt6lIuS9jJyBMfl3OQgU4/bjgowIm3eWXGxKju016q4w9xng0oQw2u49i20?=
 =?us-ascii?Q?oOjNKgN/PDjp+xKvXqO5uKIxgJS0ojo2gHxEcolJQQnG3Luv8j/ZcvK4BTeV?=
 =?us-ascii?Q?UeWpiS3034eOkjSf5mpLD3n9Bx5cCvWgBVWng1z5e06R3J+tAJacNCdDs1i6?=
 =?us-ascii?Q?O7IWM+dLtBcntEsbxrvxKdoDsjM2BQBGjhA2m4r0DXNnaKtlzxus3ksGiPov?=
 =?us-ascii?Q?Bo5uq64dGElJwRG551ZS/D7buZCIv7wTw05YkcjcZbqo0Gb5JjsDC/RNCt4v?=
 =?us-ascii?Q?J9QFCJ3kUWhknCoJZ1T3s0/kG/I0LPbRmNd3RqR3vSDvilOwHLb09UOlza/Z?=
 =?us-ascii?Q?glTGYkmTfh/FqKYnS8xaFtjk1G3ttltSVxAVPWEt2cHVsbq7uLwc3BNNrNlq?=
 =?us-ascii?Q?4Cdq/Oc5gFGGakaizv15rahmCS8lngCs8P1hC8M2cZRRDSsDFrhUsk89cqoP?=
 =?us-ascii?Q?ghyfR5gbBypUcZ6coRhpEKii660RjnAU4BFQJV0X/1KPnWkecPCZCUFurRcI?=
 =?us-ascii?Q?fMLLr0xy9kPc898HeILtku8bLtS/+dC0WZOTqGJdcHyj/Y+2e6ifsdS0tm0A?=
 =?us-ascii?Q?JBGu0QRznTuReMqBdShn1POU8DaDanhOISoVkw9H6GO/yJxdmVKwzDpnTtPt?=
 =?us-ascii?Q?QEm4+hBZVz03zWibjrDrGkwUMYRmwbz7Va9Ms1RX6plaXrrk7iJlg0A+XkWc?=
 =?us-ascii?Q?aB5zRPPg4HZnE94CE/kCDYps5f71AfHQL2rkiKrda32pSum4Y3QDSRmH+j8C?=
 =?us-ascii?Q?38ltBm/U17VKlmEN2+0LWxTyw+i2bShtDMehgTJ9dgfUpjZBNeuOpxDcSAVC?=
 =?us-ascii?Q?LzHGccUCQYJjJnOAdMD3ZTtf/BhJQgvHu2lT+c0FVc/KanRk/sZsz1ZQ0D51?=
 =?us-ascii?Q?pDRwyfC/IviOXpY3fnGsjeRbobrQLk/4fGF5tcnfHXgSREZ2p7AqKpbAMMlY?=
 =?us-ascii?Q?YEp0FWZsoxrbNmHPl7OMMnlIHRWlA6AFlhANVzrFJPrRL8iCFDtGcKC+wpqr?=
 =?us-ascii?Q?NTmHkttNOWYekx2iKIe9m0fHP+wOd6d+9Yp9FNZJk4W9Rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hwO0TkbXJdwbLhHmezjoCnei1O2x2otdBJHOvTeUnSNILhHqjmZvRC94mEF8?=
 =?us-ascii?Q?WDccvxuLnHlFl1/XQKxY4KlNytCbtOAUcGG+Bb40T2l1jL6Lpyny9HV3qApF?=
 =?us-ascii?Q?PBBstLsyRCpl9Pki2aC8KNGlZTELuFEAzXCMtuuyZnwl7ykUGfQEuMb8kbYL?=
 =?us-ascii?Q?NV8m8oCZRmQD7wPiOidUpM9AxikQ5+PJa42fBZj+fn8KdeFqfboYYZH7QvZG?=
 =?us-ascii?Q?efnAS0UGYy9/rprvlIX+JGDOzF8Gk8QtiFzL4YqRosN6iVaWCoIPN6hyp6LL?=
 =?us-ascii?Q?otT9CDSisalzEf8jsY1mtZGq68L4PLHvq4Vo3F9wiaKs5ZN/Et4p2Hy1219u?=
 =?us-ascii?Q?75m3XwGdXlKsBmuktoIljNGh9FBtktrrTrfc2YD/McYgJDAoOAZZmMguyiLp?=
 =?us-ascii?Q?w4R+DuAiuk/Ke2dSzMauifkJEU50vByKudy8J+VTr+RoCRJ4LyD1hNpg71qX?=
 =?us-ascii?Q?r/SP+M/O8MwNDosXkXeIYDoVB+gBYwsOLQwSW49T+o4davuINTAI3t8sihFS?=
 =?us-ascii?Q?JJMoI4cMROikGcuu8CTsmuvJXoT/bd4D+jdW/ao/gFa54yhuHYf+kElVOE21?=
 =?us-ascii?Q?idT9SWneo38Y0M7kjqryQK70NRtDG7x6gtAn0nfriCrrsiq+KXCn4oKYiE3b?=
 =?us-ascii?Q?WgEM5l9nddtJwAXbKUqgfo01RvUoSv9a+tsfB/fT3GDp6dTxjU2GMbnK2CPT?=
 =?us-ascii?Q?fY6vtd1HEUmo0rA7KDKCjovNldgrP60VSBCpHdEvFBfSmQ38vnoAoZLlPP6C?=
 =?us-ascii?Q?X6gmHCUcDzVQ6QcL2vz9J6LUo1AA5/YgkRovfVZpk0nqjUtWFmCowvxuWzLV?=
 =?us-ascii?Q?0e2i7aUpkvyoPHzgE4Rlr4oNzslqMMXCFvBJbyLL4f1/OjZPzNLIn0nq6vJT?=
 =?us-ascii?Q?3Mh/+++LXihI6A1RJS4reGc0CQnd6WNuFtmeeuT+bkLAnlCunRZ0N1VD3Xfl?=
 =?us-ascii?Q?Z/XBg/Tp+i5nTGppMj2G1+oct6xDmeUD3L8D4WYf6my/f0C57FwzS3G/WfsE?=
 =?us-ascii?Q?HUcIA7Sc9PpILeXouEjWy9I/Y3N5rKliTmt00WgfMQjEzHagcbSVAwCmtnqy?=
 =?us-ascii?Q?Gjvtx/4fX5Af/vR3J8scUC/LGaVIDObSUvuMG9LJJ5ve8tOusdmemKkG5h0O?=
 =?us-ascii?Q?r8Cb/OYqy+NAsXPJOqoUWzuln+ey/ZGAeGoj+ARrGTG6SYiXZMNf4wzLMC0o?=
 =?us-ascii?Q?wlI+W5fSBvWWF4CSSUNo6iKjfGaooc+vwxMJ18eogis/ifvwfPw04e14yK0I?=
 =?us-ascii?Q?5ySQpEdZvUNn9HMor+/RNhZak3yf9wrM4z1zuMklLnBIi/e91rQklIcqh+/O?=
 =?us-ascii?Q?EDfoJ91iq++kcoUTDfbrbpcGFTb9osK+p1bW8BiODxPgLN87gTT7ZqRoSvdH?=
 =?us-ascii?Q?s75++jq8jVh3K9RiP7I14HUApO12xAnkYLRPqV5LbW+8BlrerXih4jXmAOQu?=
 =?us-ascii?Q?Q04Ktdtd7xWJIW6GRqbkhEbz0xtWHxXwjocKdYXpOP/BqGnuNc3S/4OkCYay?=
 =?us-ascii?Q?TDmQU+9t4XL/LN+g/3OShZLLGMLrLHnXpNkMNwXcDlS0Fk02/6eZ7BYN1b98?=
 =?us-ascii?Q?a7/EAinfmbw+8sJPLlKKQ7KXeDLaJvm5EFc5fN10?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xJupzqNSHRF32/zJ+yCbfktXeRWPQX52E7UGcfaCYHjPFpzM2a9JJmcHS7YK6M86LKOqjHuif6X+w5E02JFY1MH8sy41zJ46atNFLeVfa59Tn50lrwT71QstG/k+iH4IL+VEP8GJA6yjC8J0kZK36dV9Lc7ohxstE6KgQi7OWE0GngvM6AgxSD4Drd5cb4PDPb5a8UfB7DDuK4QKkZVnXK0H2a5VYRMdJQfzERwkeASWjIkpC5QYhRb8biqaSrDTNXq2RSKBiTaTGuFuuQe9JPOObDwO2JWeaTTWCR6PKbiV2IRLyQgFONPRlLoxPEmKWVMFWdNEARLzqPwTfZI4RDCpgyuhmTdL9MGfZSpQ7lbdGg1FPv7cv/gNmNr3kgKbtrV1lJjlvNjwTmpkIUcGaz7USYVaoRODHlnST75xgBbGbkSbNsU2+iiuQs8G0F26FrNJFyofVVBsLMxelmyb16s/g8dHLAFkptEx0tNkBSSj8H0rNPa4OZBA1+zcKYC6C4Tx4IYFVosD7hjeQCano/o0RIzvfoAyzI2FJSYxvtOcs5GBDudk5q2ObZgq2bQRc4rcBZmj5Pny3d2HI+jeOG08wCPQ+BUq/mc/K/Lik+c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb4b85f-93c2-49eb-373c-08dc97168040
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 02:03:27.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lqh/8wMITgbVa8pWk7eixYlatR7lUDobKH0Kl+ka302w+xcBWzZN+J8Wy5Wi+FiTNS/KX1Pl8afpMmHfbJ8r2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280014
X-Proofpoint-GUID: -uQ6zuc9_lhIgRrNZNU79nrvd0XIBUH8
X-Proofpoint-ORIG-GUID: -uQ6zuc9_lhIgRrNZNU79nrvd0XIBUH8

From: Eugene Loh <eugene.loh@oracle.com>

Do not bother with dt_cg_tramp_copy_regs() since the copied
values will not be used.

Do not bother with the (second) copy of regs[arg0] to mst->arg[0].

Inline copyout_val().

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 48 +++++++-------------------------------
 1 file changed, 8 insertions(+), 40 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 38974609..eeb68516 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -611,33 +611,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
-/*
- * Copy the given immediate value into the address given by the specified probe
- * argument.
- */
-static void
-copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
-{
-	dt_regset_t	*drp = pcb->pcb_regs;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
-		val));
-
-	if (dt_regset_xalloc_args(drp) == -1)
-		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
-	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
-	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
-	dt_regset_xalloc(drp, BPF_REG_0);
-	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
-
-	/* XXX any point error-checking here? What can we possibly do? */
-	dt_regset_free(drp, BPF_REG_0);
-	dt_regset_free_args(drp);
-}
-
 /*
  * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
  * prototype looks like:
@@ -655,22 +628,12 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 
 	assert(uprobes != NULL);
 
-	dt_cg_tramp_prologue(pcb);
-
 	/*
 	 * After the dt_cg_tramp_prologue() call, we have:
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Copy in the first function argument, a pointer value to which
-	 * the is-enabled state of the probe will be written (necessarily
-	 * 1 if this probe is running at all).
-	 */
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
-	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+	dt_cg_tramp_prologue(pcb);
 
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
@@ -699,10 +662,15 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
 	/*
-	 * If we succeeded, then we use copyout_val() above to assign:
+	 * If we succeeded, then we assign:
 	 *	    *arg0 = 1;
 	 */
-	copyout_val(pcb, DT_LBL_NONE, 1, 0);
+	emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.43.5

