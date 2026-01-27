Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471E354AF7
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518611; cv=fail; b=M+69zG4Kkq+Vm2/s9+sZYqexnNNb7iOq/c0jy31PAjqcD9yAGJlBJOpUgk6nq6/sTkoVBfVFCOmuiAipQRKSVTOynHlZrymUithngrql7GCbOo69L4AYfIaAyRvxb+gzPwvh+lz0+myfd9luKjBTz2UZt7d0wz07ngnCdtW9YRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518611; c=relaxed/simple;
	bh=Plm7wiv7PFNK8sL6MhOB9GM7l6yhmKNqx4HROR8W2oU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=UZ88e7+hAyhxL3b94GJIAoE3Mr6K3OxXtZFWAO9JZLlVcK7CjK8HtGPnS0kOr4BPyvSdfICu57CetJrsVZ8fu+kFxStzDGonFOsPh+gRu/Z1IKUuOdNZORaCprZN9QHmCp2q436XMYiIhWlQhBuKe6V6v/H4smhMgiiiyzJJODE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kv+b/lWT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EZxmvHAr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kv+b/lWT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EZxmvHAr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBELGL3280551
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TrOMTuX5ZVnio/cxVA
	3+kkG0p/BqwmvE7P1uZ3HVMsQ=; b=kv+b/lWTCaOi8pWbE7a+uFeKkc6aknyQTe
	LLJyQvFRTU0qMWc0lLHSfSl43Up5l3JnIyJr3h9LB82V/qscDQOROBABxvM1x0Xd
	eOhW4TDDOINiJfDTOf+eIBPs7KK6pEKocSDGtJTRjJz02brX9VsuXv/xcyuhrj25
	kEiYDKpeMYYdneCaiADw75zlrqYU7QKQ+KKX42yf1n8BYuIND6+v5VR9VQ1OdWw9
	WKNIH9KGBNVAXeVjbc9QdVXoNfTooFc/u8G1UDoahPynAhHkoWmDaW5lxy4/tnlw
	e/rZ3UtgboFiAAagJuK/xz2Ng0Nf06BbeCoqjNgw/RuTkBM6RhnQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvpmrbxdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:56:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RChWr6019895
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:56:48 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhengw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 12:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJjgkwW0KXLSR6uKpLBtyp98eh1HPTTgPzdSuWj3isx3i/cK8yR2DlWhtvlL8WCqGnlAKeiNd1YU85VK3I844kCk2c4LdMlVTcXNAKLnhks/aNsqjsIoPc/5ygYPPBbKMt4J0iNcUf6NBHxceqyTbswl46mREv6V5XeX9Y54HQtsvXtadlvdGzBaJUxOZnMCxp2CPXLgCrdBFIC5Cz5VpA/u0YPcb+Mfotw6XXTU6WyWFqfRPeSTbQsQU5d8DsCz04NB48GY4pE0g1QcIi58EhwfqB/WxofzgkmSFKbrl5bPo9CEKmSpg2+cViBf6/8YcRp4cVJc2bWdk6XX9okDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrOMTuX5ZVnio/cxVA3+kkG0p/BqwmvE7P1uZ3HVMsQ=;
 b=JPWh+TPcCvTZ56i6XdIuZ3AymPRYenkPfbd/0IurE2d4OVdKmM8XufPRSluVnHmqGrrW2njEcOzK2FGy7FhnnHbVBQa9+GsbWRmXmYk82gduR1GMs0VU87vJsG+xCK95CvxGp2TT6C9fj9AT8X2E+Oap6nOwjr08xWNSAGbUKCkcejqpOKWVRU3RLq3O1WvhTnFNE1clwAnUDx+ksF8Rx46hDMmP7WOKl1UZmAxovpwA7T6d5RSnw+Cw2qSu7JtoAZUM5t2R+Z9nfpmymVNQPHJBfbtUY2lJea6NssKQq/bSqhfsLjz1EoQ8YHrZbSiE1Kj2IOmnXdsX10AYan7q0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrOMTuX5ZVnio/cxVA3+kkG0p/BqwmvE7P1uZ3HVMsQ=;
 b=EZxmvHAr0sK+FKh+N/Wg4xky76SEwkacg9URi8ZdGqmc4qy2Pg+wqB94Sztj9TZIekrZtlqLGVRWd7islPh4EkNiDpfgD/+6BFRAdm2VxC4O2IEtBGPLaVKw/P0VLN8fWWOXZ6I4iRYWPk97lyany3caXyBdMeDzmc1sdqbzpn4=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by MN2PR10MB4206.namprd10.prod.outlook.com
 (2603:10b6:208:1df::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 12:56:46 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 12:56:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Increase syscall entry timeout
References: <20260122220154.20552-1-eugene.loh@oracle.com>
Emacs: it's not slow --- it's stately.
Date: Tue, 27 Jan 2026 12:56:43 +0000
In-Reply-To: <20260122220154.20552-1-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 Jan 2026 17:01:54 -0500")
Message-ID: <87cy2v2oz8.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::18) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|MN2PR10MB4206:EE_
X-MS-Office365-Filtering-Correlation-Id: 79bf6899-b98b-4575-873b-08de5da386ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gOVhHjuoowgLWdG3jbD2TNqWwvS/AisG4jjKMBOg+Z1rUHD7uIvKeXmZpdmQ?=
 =?us-ascii?Q?rjutv+UtNhqjYfVS89EfBJWSG9taCJ+dgKRR1c2LYCP7rn1gMKwwudPBM4Zb?=
 =?us-ascii?Q?Q6TJ4lpZ8JwrfnH/RyE3nTjkIhai7H69IcxO18B6U7SEWAnVa/8BJT9qI+6d?=
 =?us-ascii?Q?D2xnVLtfbNBks7hq0bpLRktfxGjqucwmvQrdx0As0R0fc4Q/yt3XeXVw2JhR?=
 =?us-ascii?Q?/WHN3CLzLtok0IpGLN53uY2/qyb42c0VzrIIeQj3EaX/miYUDxitWW5fZBMc?=
 =?us-ascii?Q?XTOt93tQtxwa3hwY91xjhkCROAvvzrpXrpfg48wZ7h0gT5FfB9UIGAfihn63?=
 =?us-ascii?Q?fQ8aoPrntXGJRyvt2pBiFJQbcX15/ViV3C+O8yPZ3JghdqpvQ3ob1xzKDGC+?=
 =?us-ascii?Q?1y3F0kxYKQmAZ2WJ1DP7h/WgX7VR285xabAmcIKv2t/xtWutIqRAdtJyhrHD?=
 =?us-ascii?Q?o2WQmF5cmdpaA0vwQ7V2ZAkx0iBtDgYpdonUDDiJf/oTTriFyoR6Bl+Rv1lQ?=
 =?us-ascii?Q?ZVviViqn3nuKXOBH9piCI/EoxPQFFNKc5k+qVSPY0B3x3Nlj2ag6cFMaVM/5?=
 =?us-ascii?Q?wkpj9S4Fl8AjyUsltTqntH5O53rrN6ersXPPDIdAQyEeuO9Ki4+9h4MESxPI?=
 =?us-ascii?Q?SUMnYa/dJuw92SKmDo26FaO77YIyIAOewanBogp4E3y3gI3nleY3Oq1kglQj?=
 =?us-ascii?Q?rAlXO7H3fJr3NjVOFEGJq2r59nL/Q5S0iwex5yAt505FMzHMnRIJyv7e8cUP?=
 =?us-ascii?Q?/7ylNOD3u5IBiVL0INpYL5HPNcPA/uYopSEMn3FZPRSrLXKACGbt9Cjt5qV9?=
 =?us-ascii?Q?x+5ustp7p+r7lXov4N/LTswAODw9smQFq9CcCNbVnQo+NfC7LWAb70LfHjOA?=
 =?us-ascii?Q?IPNHJSH81ZAd0c2V9C/jTOQEHUcJEpP8DRwJ9ORnHxL6J2PVk8fJS9z5teFW?=
 =?us-ascii?Q?JbpWt8fZxZOEWdkliI5XsVUFPZP/zUxyNh5OoHGgR9+zFvHq3rtz4duh5Vz9?=
 =?us-ascii?Q?fEnki0wEQWy6/TX/VZg+EaE1rFh7pY4Gb/yvCCLxoaqcHl/euQIjfIz8nl96?=
 =?us-ascii?Q?UgXWnyx3RaOfe4yhqeY2s90KLM1F0K/Mv1DaYTsiBxOk2tcn0g3Qux24K5Fw?=
 =?us-ascii?Q?18v2p9WWA+CsrSOeYnn+QRAHcKIaB/t1b8nGawwC1VpBNlr7mgoxw6KPKmev?=
 =?us-ascii?Q?uWc7HQlwfqVRxG9dbJuQPebPPK1y/OFg4eZSs3n5cBdN42Ud+EQu4ChwCnaL?=
 =?us-ascii?Q?DEKNOOzqB85OJ8yNcEDcU2jRM9Ffc/YtgwwX189Q0erVr6rxbrYOnOsxtnFc?=
 =?us-ascii?Q?tpp0O2zHI+Hjncc8uoCZhQ/TpBB3WmSGZLa24OoKdwrJpmNAu1kGJXC91N6D?=
 =?us-ascii?Q?OPs1Y7tH//iLm/WyHvCy219oFD7+xi/K1AcqIqFWGYbdBszm0OsTf6BrGsXF?=
 =?us-ascii?Q?D9ofPUif6XR9LdiLRIljU1V4RQmHzIJRjYHs8U86IQY6iYvNAFgc1KjNWMSr?=
 =?us-ascii?Q?a4rq5+JkMGNF5ZWxoM3K9nE+1Ud705dZW1u7M0BImg1a96ykyece3Fb9JH41?=
 =?us-ascii?Q?6S4OcP+VcZGfCpe3YYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7WSvkO8wuPo/8WGyXEVj1oru7oT91HlOJzLta/6eujGcyzowzKhjsDlaK26?=
 =?us-ascii?Q?ziVtv7dqqKPmdSkImXW2Z/nTZJSRvfLUSZsKXCm0kKJoSY3HisuI0KRtFPNt?=
 =?us-ascii?Q?ceHzZJ0lOvGaxIhGZuYl5QQUuAt+z2FJtjPrd9WgXy4L/a3ESfVur0YmsGW8?=
 =?us-ascii?Q?/S0gjKWByuRZUQazDZFCbkGtRNP0WFtcVa3WRz1xvrenjmn35eBvgGsb8kUY?=
 =?us-ascii?Q?RoEWC/v2Bsn7MdlKwbG6EYL/Kpq/IdLSVEon1bfmaoUBAe8gl0cmuEsP5xNp?=
 =?us-ascii?Q?eHV4hrQQTzCmK10jw8Tz2TxjcIMWowGf0FbzZCrkNtIosOctoT1Tj6KMZk2x?=
 =?us-ascii?Q?lR20v/hXdEpRuMUtq1WnWTR/JmQXc9fzt2Xe1KWfh/FN72prjq5r/vskf2VC?=
 =?us-ascii?Q?5kEf5nC2h5cUj46qrxvBdKdLNh8imQXsCE/88jCZoCIjAJecOcGUd8c/ME8P?=
 =?us-ascii?Q?MxDNvt7bm5ggNYE8eIwKqi+9SKCLhvR/XQDtv/lcmGnuDV7ZbGrj5dSjR3vi?=
 =?us-ascii?Q?IpnT7AL4bwadWttVZALaOJfNpsmFGnwIuJVZbCHR7YifNWQjj3h6u2udbb5O?=
 =?us-ascii?Q?v2gno3ybU6qJEcNDEjLPCgW7x2tbYW+C5LcmtvZvoPW/Rp4DD4j/IO4E1d7z?=
 =?us-ascii?Q?G4dPQWTCBfdPlKiAeySLKY6rHtPvtY0YsMrgI35CkdlNswqRMKR0koThG4Z3?=
 =?us-ascii?Q?sSKl/bv5DibuHPQiewVsIpMytMhLxNvFa86JPvl00/UckQYlfjToPAZzL5hW?=
 =?us-ascii?Q?g7SNxRcaNerqfdvYqz45sQWLA0DBkZq9LtkX07KYHq6dqz3knuKC8tRDDJO5?=
 =?us-ascii?Q?GHFv/A7Pb8Te7/O+pcTHLH6W1ofE4zfSHB548S9Z4trs0iOR83WYI4Y2e9Sk?=
 =?us-ascii?Q?l/K8vlgKkH+La6deE6RaA31Qgcjld53UZLFM+RlYA8OU5nhIZPuCSOyl5u1U?=
 =?us-ascii?Q?kw0p85IdVluPGvCVWsIvW47QFs2ID4qfMkn9wzT2f0Wazv0W6i6SHSSJRv5m?=
 =?us-ascii?Q?TyQ4MF76ko7A1vvkfA6ViRQKjSgoVIz47VJBBO11wB4t+QR0UxNGyrpVPhEj?=
 =?us-ascii?Q?tDNW0KZHoQn5FRvBct6ks/geGpPnUs9Y9lMuoL6NbYOJ1ytUzgHuNLfMzl2O?=
 =?us-ascii?Q?lPcAt7fjPgy6yhUid1px3sjsZhb7/2G4xxeN++CCRyIzq0HmnMRhE41pemw9?=
 =?us-ascii?Q?hVbYd/zq4a+Th1UzdWDavCozdncmZFoEsX40kRYsbZTUuFqZeQ6dfzcC1oM8?=
 =?us-ascii?Q?6XgielfquDz0Zg/IuR/sveMF1eoA7ljKiFlrRpU55+YFUFA98KxI6dSqdJpm?=
 =?us-ascii?Q?k0c4q+zlSd58gwPlp1nhaWE9R+0i9OlSZAFc0wBvcB+3THY5o7vwn3oxzqoO?=
 =?us-ascii?Q?KZ3okE50Oq/ESMmczypwZk/dL3yp9ICBYTL7bGSUHJTTLsLj83IXHlEwFANE?=
 =?us-ascii?Q?A2QmJ78QirpWVMaXKLhXg6olVN0fjTib3i4YDq3meP/wNZVsr1gIaP1u3Ag9?=
 =?us-ascii?Q?OGPLaBkhW37y5ZX7mDdNBPHy+g/84W+m923DA9sOGtlpSg5K7xoxJ4ZutDCv?=
 =?us-ascii?Q?sGVXW8/2GhslXeWmUDonsYEH/c7YY5CplyGfYMRwYO/KReLAA2HP55YxcH3V?=
 =?us-ascii?Q?xG6SW1nMviVVOpfp+7njzTDoTslW+Er2Br7NKgL/7vScDiaS8Xj3yYiHe0i4?=
 =?us-ascii?Q?mIK0Z0CN2eP3a6qm9ZvEd1WQBvP7CF/wtzsh65zbOtTcJfvD2rDFN8ZNqxNI?=
 =?us-ascii?Q?s6GFwz4uFQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JQqF2xaRYTdJVtbd3SMmjYlg6ZGpBUqzYd7IHMNiNgOdvjAwwg3xpBSFHxRxHKFqskNCKveptctS7m0DEdGtjBSiivm/vz1igvYvOXaIGvXaCA8TSRiORLbFbjBskGkkEjKmrXvYif6THlwnG9kOApG5EZ+H8SIOqe48Hl77X4ncjMwOiJ6cRz1yrq3ouS8DEVF/60hC/3O07pt69amfXyEejUdkMWtUe2uVnXJnxvF5Ac1OBVRDo2xhku9p1LEaAIkgc7nl5bDVmg/dMT36H9zB3elAh2CqJUj0BYIKavra9XWlKYB2y5p2YxKLH3yIHm4KkyQCjDGdjSHAPeAwJkZ8xBu762AZ9n3FhGWLLgrQiJIGBP+VhNDwDDi8KwxEEyJu9ayPn8bWT/OdRQlcHRFPfOXFDLFr3A7VqAVN3C8YCRx95I3FGX2eyetdfSLuDZEs6afRyxAERBLhi2IRnhjFYo1tjE9SZTSlsvE0R+M+nDqUB8zhckBjlsK3oqmAzKy/K3UGkwHHSiUXc7NsdPZqtX1Biebq2zukMS+chUrp11ikpoJqPwaku3OXZt7RfoM1iM6Be4t+0Cn1Yytml80X489+ui3Lae8QqMP3WvI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bf6899-b98b-4575-873b-08de5da386ee
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 12:56:45.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvLwClvDE6UwOXSO/DL6YguBMtgDtGmAKcen0o2cUoajFcmbEOC7P4SZJNzD0RxKOfftwE9MdrKC4pEQL1RzLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270105
X-Authority-Analysis: v=2.4 cv=Q//fIo2a c=1 sm=1 tr=0 ts=6978b611 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=B7sye8qDw0amv43tXAkA:9 cc=ntf awl=host:12103
X-Proofpoint-ORIG-GUID: _GRXb06OygH1c-Aqc8MoXldSbPriZeWr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEwNiBTYWx0ZWRfX35DFtTS049hh
 VzRarb/AQkpwktdijVzHCMUI1W+Argrc9gwU72CbB0fKij609KB4WaPLlpq7ZmCk+A70MDLLq+i
 WJsxcqAqVsS7NeqsizYc5r8NjvmO7FP75sVpSiBEMHCYAuNX7UlNobFVthZUdxhyA3CgcBX8xlH
 nmi9xdh99YFjCoUOP+NQqOEun2R8ye2ItLB07Mgx27h6eRiChM6pI8dW6NEuCzw63OtjWe5x17O
 xHlM1GfMoANs+n/60dVXmlDXvlVgHSyuZj/uqTPq/auNs/rzI7fHDZmfvq3BGJiNEe41zZmB0eT
 7Im3IUgaKGshEGqHK3FqxsjJrTSpK9/2lU8lmsRcmRSaioD6VObYjqYXyLtMulNBejK+tpZLQN3
 Tt9g4ODy/xhQfozYj1iUGGv5tkoJjarX11ghLGtMBvFe6P0iMq5J5dlrxyrHMzkiMRSzHnoytFm
 mlUmlYjkbyi9TKia46mTcnuzpvrw7ZKUDsNVXfCY=
X-Proofpoint-GUID: _GRXb06OygH1c-Aqc8MoXldSbPriZeWr

On 22 Jan 2026, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The run time for this test seems twice as long for aarch64 as for
> x86_64.  Further, the run time seems to have jumped significantly from
> kernel 5.15 to 6.12 and then again to kernel 6.18.  E.g.,

Ew.

>                   x86_64     aarch64
>     5.15          7 secs     18 secs
>     6.12         12 secs     33 secs
>     6.18         22 secs     54 secs
>
> Looking at a run on the 6.18 aarch64 system, the time is basically
> spent in the dtrace_close() call to dt_probe_detach_all(), which does:
>
>     for (prp = ...)
>         prp->prov->impl->detach(dtp, prp);
>
> Then, dt_tp_probe_detach() calls dt_tp_detach(), which does:
>
>     close(tpp->fd);
>
> This close() averages over 0.1 secs.  For hundreds of syscall probes,
> we get nearly a minute of run time, exceeding the default test timeout.

Sounds like another O(n^2) crept back in somewhere in the kernel :(

> For the time being, increase the timeout on this test.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
