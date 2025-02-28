Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075924C7C
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 16:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758438; cv=fail; b=ed+hPDe+QP1lTQGEKZa1kBapb3U0/pDaEG6ru5jpkKzqzWwCPqso75xKNicOiceJ2jG5RlTeUtRQEIX6+7lrB8tC7arqMDigYD1pmPy67YznKsZ3qMS/8tuCcbUBo7dVM/oNFU8DWLbm3UOBHjsoo0qiyyxtrpVnzuRNL4kd6DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758438; c=relaxed/simple;
	bh=zgkU5sCh+xRxeBacdwRiIDuTc7GECIcpGkLkr0sqCSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PUVFDyno0Qqn9l++Q21RpWJJYSiTpJBSFp8q36JsqkTCp613r8dteR2CXNqAqo4KKQWJwhjET0OjD+WDm3lQlwpSJxSEcF9IqOWjbQFp5SmBV9cFOVhGIqsNjpJ/G4BOYiHaNIyR4/tRi44cRK76JWPzs2V9c1O+LCmhBHMQlHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X09dObFO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AofrSBfX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X09dObFO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AofrSBfX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SEHZIb002792
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 16:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=v+yMX4lScaFtJKiKHe
	ejitb3+Ql/lxCewCrboza9mnc=; b=X09dObFOM7tabl9Q2BKz/LbSVpI4/X77OF
	Rq05JO6io93C3liWePB+1V9mujZMjE7olsycRwEdQaJhpDOw8Jutnb6h6SbofnJV
	V8IJoaeLCRAmipdy8nTF8fL0krrTKFSE5Ooji5Ays4ETgkQ78uEm/ktDwhHUaGpK
	//Wzsaap1lxy+uzkrGiOcx1NoE2EaOiHI5nzONU1hf/fLMbp1H16qImzD4pJPmUU
	dWMIpYFleWtXxSLyZYERZ4QwBeaM/i70EvD4xn1A8q7PjX+KUC8xW0M4NUSPz727
	co2OXsQfQVWNSRNHHcaI2sB6/3YFXSlm5L1GWTWO2eNttireXPrw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse5v47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 16:00:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51SFR3da025428
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 16:00:14 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51md8ss-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 16:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWwomH7J/mKVcr7R0CzsY5FDXOExJyEbrttkVvWprRRRNv240UhuNhsrTgjlVItquASM3KeBzcEJIWPEp6vTYqIGdEiqSPiNZ7D+oj6O2sUtEhgzMnrscBZkw8gRWvpEW9oUWq72atvYt4nx4FCrq9GNeJvoOq3sG45ogBZj2KI8+mmUcZE+BMpeXabY18ZDT7UokMze0GHtmYIMnUKtjCEqQqC6mCQ1P73h8G8rCFTYbImq2sOeAMlDduFvpvrYlQfmaocJ2qTuNbEF+uX5bQTpAsaUlxGpwz2N3ohhpr+jJXMxaX73VC2r96ez2DjzDWHjKx+vUryawBQs+Ahezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+yMX4lScaFtJKiKHeejitb3+Ql/lxCewCrboza9mnc=;
 b=In92PHwzR2fRxwmilkZ8r70xmNFM3uyVoghnyjhRQowkw+V6ngl9P9ocHNcRnVnrAqJi2ENphfgqYnWd6MslNuWlvAf7SsJnqTcHmQBiNTO6B2q5X2ySsDccnc96EFFaDjcYfB8tn4EMDckoduh5E5qIUukBco6Asv4rJ2lTRRv0fgP1jnCn7Q/neoSRkQ6VRRhCQ0Jvzo8pNg0pR0o186XrBXEF+nIobn5UXPU+9Pl7AiZDhs3aF2vFwk7kaiFe/UwSm9Sd92wxBDFsZJ3kckSBdXFLZpI20zLuxRwMieRcy9IwyQZBm3wDfRAGq1H+8ugBBMc+SlxgeqMF4vLZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+yMX4lScaFtJKiKHeejitb3+Ql/lxCewCrboza9mnc=;
 b=AofrSBfXhRXkpBTYDZ2dJVd984W31dEfPk9d4SD3SkpUdNQEITA0OVwRfnQXaST1CmFGS0CirAcbA9vHIR2NcdSpJ0BXUQX6nPlhYeD+yJO2W+UE2qgFyJUwhoS2y8k8KODzILIySlJ4GDxkrG504xAYuphRzZ+PacDjQDXlxOA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM4PR10MB7403.namprd10.prod.outlook.com (2603:10b6:8:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Fri, 28 Feb
 2025 16:00:10 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 16:00:10 +0000
Date: Fri, 28 Feb 2025 11:00:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] test: Account for pid:::entry ustack() being correct
Message-ID: <Z8Hdhm03_VFrEnnL@kvh-deb-bpf.us.oracle.com>
References: <20250208232106.27146-1-eugene.loh@oracle.com>
 <20250208232106.27146-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208232106.27146-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BN1PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:408:e2::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM4PR10MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ff0fcd-1e49-45c8-94de-08dd5810fa79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JjaI08ucut7/zLloHiBrMBikXHEa+6aTv1K2GJwJ6Tp2SZ4BC+F/BpiMqsIe?=
 =?us-ascii?Q?Haj9nuhYAymwCu6Yc/7lb1P8yUpo5ZQ7LzEaLDPGngzRJk8yu2f0mfyp0SmH?=
 =?us-ascii?Q?KediqN5dEvmKc8zNB0uo3jXF1A2E3UDCenEcg8+XpATsbb9O73w/I3YjgHlo?=
 =?us-ascii?Q?7K6HGWtnEtO/ZeV1wftJTXIzlg4c3QI2a/xfl930vDAGihFbDHg3ken/C3Dt?=
 =?us-ascii?Q?47FmIkvZywIMCzDWZ46By+Dc9wYfdcSy4h+Qyo5PnCpwOsqc9DYrSsqeFewg?=
 =?us-ascii?Q?2mhbQAalsCXypJ1ldBmIopPlwpvZyfRqmVW8Qs5F7QFRguq7yWN42E0FqSPW?=
 =?us-ascii?Q?RDFk/CcAREW2CwJ9tubOcL1mr0NuJN8CLxp3YVPQCXRVxuzJbLs8Dk5v9baW?=
 =?us-ascii?Q?6vTqIDkJA0yF+2j03H5nebkxNV+1TT/h7iBMMHdQ6gusdf68XFa9QSzfxT7W?=
 =?us-ascii?Q?C+lYFORDc3ZRUPxQU8/xCLsJLR8pLPSYaju8wSRzCdTo/5eoohFjMmAwWUs8?=
 =?us-ascii?Q?kR2SlQjPVuNkyQO6hyHiVVHN3c94Vz7syqIqgWJudN1X1kL3Bx8YXD2WpJCM?=
 =?us-ascii?Q?kyYnhni+n71cKBcJkhnF+rtfqpcFS4cN6fY8MeXfVw7jFgVKytdinwkkTkld?=
 =?us-ascii?Q?1TUatBnFLxzVVgREYHdlLwCjSijGkRZBY2TvNoKm9lwdssZVairipH5LVEZy?=
 =?us-ascii?Q?Z1XGveLk/BzTUn5c6s0dDKQBbqEeOqDLNIXAU/McCd5uX0o3HaHuEkvhkkRz?=
 =?us-ascii?Q?MTIj3jSj+ycfHUblI7y5AskBl6Ob4Mcjgv1FX0kcu+oJ4a7si53Rp56//N8P?=
 =?us-ascii?Q?CDl2vizaWGJw4ql5BQ9lT7tg2FeCEgSfycc+2IKu2q9Vb4UBAKwcuxjnrXJY?=
 =?us-ascii?Q?ClyTIsFpe/yYJOuWMcNrQXSspOkUt1xhe80v9D5+Ct5uVPpET6JgKmxYHvDB?=
 =?us-ascii?Q?oN991N76fliYK22keZ5GVmH/Us1/bmjm++JmeK/pECqv0Qm+FmJ4Og/JhPqw?=
 =?us-ascii?Q?Ia+otzdGAlHxFhRg5f7O0LFVwuv3kp9P6Yg/b3waoAtC07n7eCk2VgINo9yC?=
 =?us-ascii?Q?gt7S7t9to0lyUzWIwmmntJJH0AfcwRpIwoChKB7P7U5dV/OW7t6f2PAQo1BL?=
 =?us-ascii?Q?Y+Dai2qcpLZmIzusHZDBTgUKFFmYeF8J84B2lr0A8ALFTyk94CYOIvEHZu75?=
 =?us-ascii?Q?WeKirr6O9VH/87an/XGjgrCH2Ku0vTAvoM5hXh5eKaN4YoJye0b1WGy5eLXA?=
 =?us-ascii?Q?Jecg+ZSoqRpKvNWF8O8G4esS1hzgnvBZeEw0lmBRKne4qkM0jXKxg9yir+fE?=
 =?us-ascii?Q?O7ZK7YsT2GDvwoWarF9ca4xRF8Gwld5ZyjJW3W5JfgKugiEcMdlzNfNWsip+?=
 =?us-ascii?Q?/E8W8bBd98u6K8Sv+qkbs3qegocs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DjDWt+6tMsdvuvlzIxIlwJTBpkMVUc6h8lGkGhsr/xvszo9YCiKRazCil1nV?=
 =?us-ascii?Q?+8+TEMe2Gp1AveP5kaUMlgytq9TWT1b+P3kdUJ6zg9HqiozueCbEC5dACM84?=
 =?us-ascii?Q?ZpzVrdjBPEQd0DKPMHM6i2guYSqB6vsOY8dwhYfuY1A/H6zj5QvLiHRzdO8R?=
 =?us-ascii?Q?CAMnd4Fzq9+jRZ1xSX+V2z4gG8FqYrvrsoGfW5GqV2KCIQ0ePBCXeVwFhWND?=
 =?us-ascii?Q?m6bCShliq4/m0h/fwZp5O8arch9yal3uniXBHpG3kfNNsAEPrkbmcM7YLFqH?=
 =?us-ascii?Q?c0uT+Q1Xj6V3dS5xAxZRO7Aug1BuHmstfuMKQ1ZdijpPCuXYldab1MuMFBT0?=
 =?us-ascii?Q?GvcbzziHMMcL8ZalRHgq1E9PXhVyC9/XyGam20rQitqMC8QD/Hjqm+KceCZo?=
 =?us-ascii?Q?T/w7CXg5KdkYR/BY8vUwngu7CaPZrmNzKuVgtUlwj4MSjDzB4kDto0rtfdXO?=
 =?us-ascii?Q?Bvzmg0qkZHt74J0BcYuwwe5Y2wlCnGD+AsBvF4upMtap/vXmYCwNCpCJ8CrC?=
 =?us-ascii?Q?o1XmqeZvIfIZqxTXTZTHesJSZDe6uGvhhpONApiPW0ZrfRdwdV8I8x9kpbtC?=
 =?us-ascii?Q?nqpsaIq89nzUY5V8WffwZVqKejVD4boFA34t24NLieLDNqVSSSMbEzP+hdIO?=
 =?us-ascii?Q?tSxXZROsk8jZSCha83jdYch70qM7JHVixtNd418KaTTYCt/2OZffZ67WmyY5?=
 =?us-ascii?Q?M3REUBam2ebrMNXuyQ3ure7Vbn3gUThCb4fSFBBEIXexMCz2GOVJD5hIr94O?=
 =?us-ascii?Q?94XnyhfyH8bq/lyKcK0oAUx/nDVmvpmTolbikk4EmAdqxIp3XztxygSQ1mX6?=
 =?us-ascii?Q?BIHKxURTvz60zUeEIF3YxXEUyTIm1yWkvNU60x7j+Mg/4GFbeQzSBgxX/NnV?=
 =?us-ascii?Q?sjF43VzPDBMk/DQHuWoWdXyc+b+tNpF3vdeSry8ICKNT8Tn3+Nd2rCwccofN?=
 =?us-ascii?Q?Ws35A2r7c7ESc9sEZVrwWB16OEBI9HAbTbdv7Z0DYjyYPGmDqZU1S2AfTAio?=
 =?us-ascii?Q?Jpdzl1B8yamDxT6EWSsHP1Nz8w5KYFdngcRUS27/bX7WHk3Q1n83gRCIbQBK?=
 =?us-ascii?Q?mdvN0VgrLVJZZuypj45kNCKoZnbYoOm3TIkkEYxbVpDpvPJ1qf+3e0iSSO76?=
 =?us-ascii?Q?H3ciZ+cKMHz+qgWacfSQ8/Z1wfZo3Ii3sa0f5sR4BuXJciDkD+nEmaLVjYTt?=
 =?us-ascii?Q?z5DmvnVTw+89gMnLHV7uuY2/mg2Qvoh6ptFVt+GiJ9K5Aw+1PeyAgowL66hO?=
 =?us-ascii?Q?/yCdfCY5pvg9wWdE28qeBy+UbA3w37ksILxVh14l9wMYD+SDehKQIVxqrUwZ?=
 =?us-ascii?Q?4zpLUFZl3QOFxdDUnpjvyt/CWPezTZGpOgMOrzEsPhmop69BGlSS1SvPtjTi?=
 =?us-ascii?Q?4WjYH/42/Lhmb8W6BTnRapOybejLiLWr2nl8ByfFJ2VoIe0v3qNjhaDBbjGA?=
 =?us-ascii?Q?y5u5vxAmRuXZvFnqbAEZrjkdKA30WyYoJ5gLxs5OXHgiTJPkwD+NxiReKX3u?=
 =?us-ascii?Q?8Z1wgbo6rHo5bUaVjECm3c1hRZ9HArNmbFeyu6MvOTWKeEH5dCdnlQW69yPe?=
 =?us-ascii?Q?ae8hkfhW/aoZSpa/fpWi87a6kX7zeJVCsuZTr3gBYMNh4m3j9ItYskXUFRze?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jC+IWJ0Y8uHB5EqwXf0PHBQBo/p02EhRAlEVguLeGp1mCllxn3u7f/VQyOXksGVtg9UG5KRBKEzaIwvM9CQwPV05UzUmfEDhTlWLoootTQKsjGTSvSVX+KHeooi9d9zVA71y8SGfxu6ONMhDPWrJKQjP+q2KtK74d0P2ww2/bia3xNEtIM0RfrmuvslxcoFpMeD/c5tNImxLFSDfaO6FrlEf7+S0LV0yoDBbg81G1qR1HkGH+KeEmOR4nkcM82kl7ti0SKT5WHdBarXaBA3ihFs6BRebyuhkqwTOf+1UIj55WYwCW6I6CPeW64w0dZzWiSncBGleUN3IiajN0bUjStcYWiMIEv9nktQA5y6fCIWMpJ9lZ7yUIJnHR16Q8yI69Z9nzr8M6pAynbHAUn4KkNn+7yi5xvWmvsT7kR4gQCaD5/dNb5lrntgEZZqk0N7094QdBxW1JCsBPzjpyre4sv8q14pZuue6Hb4houOgw1Hgr0D9RckE4+/oskxWLHxFw/VA0vqr6LmCzHuRYGiaHZZ/LBCJU77dpeyK1bF3Ga4E7c9rQ4dtbBx3Z81VKNZahgprd+GPboL2bfvuR3AbYIo/sBnoXB+vq4RgF7ZNkdw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ff0fcd-1e49-45c8-94de-08dd5810fa79
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 16:00:10.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M++s6TEdSH9jr3n1UOwLZHoXEQQLYNoeZQK037gZxRlr2K2bGCf7baJVxpJ5p4qlLCaOsFCl0HawMZU/IZr0LnZGy8Ht6vZ91ieVduMr6ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7403
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_04,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502280117
X-Proofpoint-ORIG-GUID: RJSPsJBlopCtMp80_5iIcfy-uryHwoth
X-Proofpoint-GUID: RJSPsJBlopCtMp80_5iIcfy-uryHwoth

On Sat, Feb 08, 2025 at 06:21:06PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The pid:::entry uprobe fires so early in the function preamble
> that the frame pointer is not yet set and the caller is not (yet)
> correctly identified.  In Linux 6.11, x86-specific heuristics
> address this problem.
> 
> Post process results from this test to accommodate both cases --
> missing caller and not missing caller.
> 
> Orabug: 37459289
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/ustack/tst.ustack25_pid.r   |  1 +
>  test/unittest/ustack/tst.ustack25_pid.r.p | 37 +++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100755 test/unittest/ustack/tst.ustack25_pid.r.p
> 
> diff --git a/test/unittest/ustack/tst.ustack25_pid.r b/test/unittest/ustack/tst.ustack25_pid.r
> index 89b35c028..e7732fb81 100644
> --- a/test/unittest/ustack/tst.ustack25_pid.r
> +++ b/test/unittest/ustack/tst.ustack25_pid.r
> @@ -1,5 +1,6 @@
>  
>                ustack-tst-basic`myfunc_z
> +              ustack-tst-basic`myfunc_y+{ptr}
>                ustack-tst-basic`myfunc_x+{ptr}
>                ustack-tst-basic`myfunc_w+{ptr}
>                ustack-tst-basic`myfunc_v+{ptr}
> diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
> new file mode 100755
> index 000000000..6486f7ec6
> --- /dev/null
> +++ b/test/unittest/ustack/tst.ustack25_pid.r.p
> @@ -0,0 +1,37 @@
> +#!/bin/sh
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +missing_caller=1
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        missing_caller=0
> +                fi
> +        fi
> +fi
> +
> +if [ $missing_caller -eq 1 ]; then
> +        # Add the missing caller function after the current function.
> +        awk '{ print }
> +             /myfunc_z/ { print "              ustack-tst-basic`myfunc_y+{ptr}" }'
> +else
> +        # The .r results file has an extra frame at the end in case
> +        # the caller frame is missing and the 25-frame limit goes
> +        # "too far."  If the caller is not missing, fake that extra frame.
> +        awk '{ print }
> +             /myfunc_b/ { print "              ustack-tst-basic`myfunc_a+{ptr}" }'
> +fi
> -- 
> 2.43.5
> 
