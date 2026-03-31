Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C7548EE
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918970; cv=fail; b=jnwhPIbmUyXYVAvCp+dnqQBAmrEXtGQA8kCoSM8fcoqhHuJIswwYhqhzsnW7QRB/yhZBabHXB6KSKm1CgZ9jo1+bvNVfRJM26053n66aabIEy+tTPz79jtcEuhh5dTUXlT0n9T6E/Pv8S7g5yGvCyFKubvbhhc0v4B6vJfeta94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918970; c=relaxed/simple;
	bh=1jaHBJXpdGGPFJNM4Kknrsy8eDfq8XIHiaIeg+Lb9jk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggX3nixS6DOduhCR+M9SIiyEAduvI3gf4A8nH7zRke7qpGaX7fmWIX4KQHSOs1rprDRLCV5EOK5HT7yRi7wLaCJ2f1K+bDDR0JLkl4vzSaPrmO8qVA4Mz3OHum/faeJO0yX62YrVeY+xDR3IbTdOX5hNKRdHzYge+cN2ryqlkAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZRMjTgRr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uqFw9Gyu; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZRMjTgRr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uqFw9Gyu"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMIZ532688916
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/2HqcABldcmitEytyzDRvWGWJ2eQhw4pelJWR76DCHA=; b=
	ZRMjTgRrZ/mxXcIcUAoC+Bh5w4fK64jiAYaw9X/iHwRtZm4z/8BFIpK3FrkDN12e
	mtkFZ/cR6Xcxyj7aUct7CnxypdKEW2S/oEELC2V3kj9P3Ok/OIT7wPr6zhc51IvB
	ldH1z/k1OKcqD4Vw0ejSpJi8LTY7jP5xrJjKCzejQ79QpP3bhFsbu8wkM0ohyggL
	rr9JNipj9n7h4Yb/TI/yobofyodtXS5wLYsMTgwkNCggkOOSxTapHr2tDw23Mm1w
	Ij/mkHX+a1WiW1UrUzbbqFFJA9t4cQwD/gEzswtDbqxCXgi2ad7euqwn2tdq6caL
	bvxNWIhfYW0QvFSTAeHHrA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d66v5k9ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UNPMub022296
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65efj75c-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNSC3PbXY9+ylmNiluOFtBlq9YuoFjCNKm4d4v2Y4e5U2uUKlirNkHZaCPyIF1Z2vZRlsyJ6WucdKyCUVe2J0wTc5mXhUUG7rI3zfAtlzSz9xJpoZJ4Zlmmeb9s9CFGqDGhiDgdFGZQKkVYhPUJCiX20ZLk+3bnPAyjb4BMslQoiJlq+uOMaFnTECF2zLM0ZqKeqsjkK+KYhGEltAE+BywKpaMpShymoOl6ODzrFqh6M9u0TZY5fJ/HvZS7C99nhRy9p9M2BM/yc6fpr8/1x++uGhCRSHtBP2Ldbo8JDxBTesAcjZOW/FgalLqG7Zpy+dJ9ScRGWuzGz6LIIbMBxoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2HqcABldcmitEytyzDRvWGWJ2eQhw4pelJWR76DCHA=;
 b=ZW21hNMQ+Nu4C2/9cVrQ8JstxcrWIp78PVqZMLXmn0K4qWWcojbLLbu0fPdirOYx+vokUaPHcmemaU+Sq0lDShW/9sdWoN7CFNdu9jXhH8/vZuAGFaNX2xaA9QN4skV4AtaagWqx+ZEKj9ZfVt0vNnSOheBNQlmd6PodfXXU4l21iQDMOhUewwS4IPFeNJ4gY124sU/foacp4kPMloJxNLIiU4+AnwyhVkf6/vsqXopJ1IGt+gFfdZ7LbHzJ4IfeOXDqUm7LclVAIhwxo4odxRIq1K96gaQxLRypv1yu1oD7FKqIr98Ygdk2sKZqqezoSphfBWTl5hxsBA09pwKePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2HqcABldcmitEytyzDRvWGWJ2eQhw4pelJWR76DCHA=;
 b=uqFw9GyugDDwg0arA/mSCBz4Eabwk9A/HxKgFTQq9ilFMg6QE4YvzHXbjde+KyPml1lpYzS6MdjfI0bHBLtt4iMEWXJtXJyMlHzEv4fCVdO0jVR6WPO682FkztfSRmOMXvMGh9gPl7JvyQRpKcILdUYFhhLs0rDJbT0XWlFixOM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] Possible uninitialized 'last' variable in usdt_copyin_data()
Date: Mon, 30 Mar 2026 21:02:23 -0400
Message-Id: <20260331010224.16165-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com>
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: c4fcda72-de0d-4233-6252-08de8ec13171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	psHEALGvU1ClYISmK1WEcEpbGRMFBIhgblY5cVwLoQyq2pA1hSUrYamAOWUARPPTFM1c3ChZcXvZmfVHfADzjqkWh4OCYPFI3j2vCbiU0KT6CVJ6oUQknb9/jPPxB/1FPrEGthCDNAO/EkFYo6RkuSkLF6DyGN9Vf1QjEg4NTvpWREJ0GIPbm51zJFSols6+4cMsz8cd3uQXBOvGpxiKTri/0C45Ba9Gj+kdFLBof+tpqR6P9v8yGi3L94nuiyBPC7NH2T5uerF1CF47tZqFe0faQwvQRN5dkcF26Q7CLiKrJGM3Vt+R4UMJQ82X/Pn95i5y8RMjVPfewwKlCBMedzp3V6oA9PP85ga6EDqhJtB4RjHtbQF+1HLdWDYkgUmOvFqU3uY82FftjsN5G4oMVCHl8WyzYpg/p9MNebCwJnn0R9yZdbWMqA67KZOWeDukLHFlOzvlGPzWoNm/yc/u3l42eAXWzmlHGvm8eGrlxnwpfxVoWa5j+1cXGpVDOJi4cyT7q19qBeEkT3ZVEUwal6FDmZlyYGry/0wAqPM07kSj7K3E+PkLacuIYg8MKAZ2lxfQ/UUd47JPvTWIdhfBZOljA/Q9g7Oo48vwgAkWh2GEJ0UOeiBhqNZEJztPqV+XxDLxEsIjzKXQZ3LZBX+IAUC5uo1n7t+LXu5H7jUkx2IYbcMNSiNGo9vHekYkl73JHN5+zEfKR8WA3TDjOS1+Iq5OP8+B87WK2B2Qd/JTRRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkR2MjdJei9jQ1JTN3pyZ0hWOWFEc3ZWVDJhSVRzM05wWm5EN0hkREZLZktK?=
 =?utf-8?B?dVNTdUZxWnFaNHBOd2xmTm1FdnlRdHFQeVg5Kzc2N0RURGM5VW5la3duekpo?=
 =?utf-8?B?azQ4MEVqTnd2eno4RmxQaHpEWlBCQk9rdUc4QnlWVGJsSTRxMk55TmF4bC9t?=
 =?utf-8?B?blJvL2hYVUxUL3dCZ0QzS0RqY3pYcGN2NUEwTlhzTTVURllpb3VsN1hHMXJ6?=
 =?utf-8?B?Rnc3bEZVNk1yTU84OUIrY0srU1gzS1dCc1JCMFhnQXAyRDRjODZkc1ZNMzlI?=
 =?utf-8?B?WWFIUEZDNlFrS3o1TVBCTWZsS3hDb3c5QmxaTmpNczI4MXRZcDFyZk1tSXVa?=
 =?utf-8?B?MlRsNHJEdk9iYVVLZmlzWmorSDducEZ1bTAzVUNUN0d6RXdZakdMN3IzOURh?=
 =?utf-8?B?RE5GSWQzUkVXRW5pMDhhQTNsbmh2Q2VRK2ZMa3dJWHpwdEkvT2tnbUpiczdk?=
 =?utf-8?B?OTROVjRVSHd3OG80Zjl4TlhPbUx3MjMxOUp6eS9iWG1ya1VwdUhxUnkxUHY2?=
 =?utf-8?B?b0xFRkpXU2hzc2wxVWpSMUZzWDBWQmlXcWJNNWpsK0lXWngyUWdBdjJhd1dM?=
 =?utf-8?B?Z0xXa3VTZXg2UXYvcGlKUkdHNW5FSjFxVk5rRi9hR2JPY2xESjh2TDgzaUxw?=
 =?utf-8?B?QmxDZElRSTE2cUFraXhDZ2pOdTl0MHZRWDE0M25iVU1XZzlJcGxScjNKNlFN?=
 =?utf-8?B?dTJhOUQyci8yWG5aYjUxbWRnZVhCaTV4M3BkOUlYZ2N5MSs2YlllamJqcDNw?=
 =?utf-8?B?dFAxUjgzc3RaN3VlYy9jUGNCY283VktzMHBjVmp4QjVHUENjOXNReE5kMFdJ?=
 =?utf-8?B?MVN6Q0k4T2dSWlVJR3htNUlYeHhPSDlNTml3cFBmbkVFZ1djZ0lseE5oK3M4?=
 =?utf-8?B?bUFoMTZQZXJxeEdTVGhEVDR4djBIV3hyMXc4cGJjcTNjTlFXUDhWYkY5MmZx?=
 =?utf-8?B?VEVSRTRBN21FbmI0b0JJbnAvbjBXNTl2SGk2bzlka1RrV3RmVWhrd01iYU5T?=
 =?utf-8?B?anVvR01LR2RON2R2dHYxdmF6emN5aU55SStldGhjblBLaUVzQmttbExEclBH?=
 =?utf-8?B?ZElQWGk3ckRnMDdZa2ZIaERLSzRIWjBQTjJEZ1dEblJ3dWVjemdVU2Q2UlNn?=
 =?utf-8?B?Z2hVUUF3MWxUOG5oWDFuQjhMU1BVeURyT3ZzMjdjU3o1L0VoMDRQNFlrcWlH?=
 =?utf-8?B?cnpuTDRjUWlrRGZyclFCeTFlR2JLdmxkcjNaR29GQ01YVnpvUk16T1ZHS3Zw?=
 =?utf-8?B?N0N0dGZpZS9DVXV6cUhZNnJ3Z29JQTFjMGpUakI0Z3lsT3FnTnRJMk5XbVZG?=
 =?utf-8?B?dyt2eFUzT2l0cVNOR3BhbjNMVUdwQXQwc2NYc1lwaEZieXVjWUhMZFdiUEtu?=
 =?utf-8?B?UHZRSXhEMW15bWRwNHAvL1FxQlBNa3lEU0ZGY25adlZhL2hERFgxRmlQTmEy?=
 =?utf-8?B?ZlpqQkhFNGR6RGJCNWJVRlNyZlh2VXk0dDFoellmODVyc0dtRHVFcTNhSWlw?=
 =?utf-8?B?RU1NUkVFYUF1V0Zqa3J1Mi9YbjdrdHcxRjFOUGdtNWNrcXp0cFhGVkVEYkZn?=
 =?utf-8?B?dzRZK1gydkdvdlk5aXVsdVExY2VrMy9wL0RSOExUdkFHM0xxdU5UOE1ncTZQ?=
 =?utf-8?B?QkVENWxiYjZxNlJNbEZSMW5MSXBNc0JDTlJzdFR3S1c5U0JiOWZ0WXRYSlNE?=
 =?utf-8?B?cFU1UllUOTkwOG8xSm1sUitLc0szMGZQZGRrMkhBUmc0VmNTS1F4aHNhUEhj?=
 =?utf-8?B?cmRrNlg1NGhoZ3N1RGlLVU5DOTBoNzBLMVFoN2d3cXExNmJBcnlhVnpyRHVH?=
 =?utf-8?B?OFNjU2VZc3E4cDk2NVVodlZoSGloSW5iYytzaVEvTDllLzIzVFROZU1aU2Jw?=
 =?utf-8?B?QjVvNEMxTVdYVDRFRjNMcWtwVGd5c3B4TjZqblhlVUt3djNoemlIUU04V3Ev?=
 =?utf-8?B?ZnVLaVZxUVBBMWdPTWJKZThJTnM2Ymgra3EwV1JPZmtvY2V3dmhHQnRWQ1Ns?=
 =?utf-8?B?NHdiNjZudkJpQVhCcDh5VkRyZFlpOXF6RlRoTGlVN0NEUEtVdWtPajNoNFFu?=
 =?utf-8?B?TElhR09hOEVzendqUG5LNkRBOC9DUXpOamE4YWVZMTlmeVlla1RPcGRtb0o2?=
 =?utf-8?B?SUNRdUxrM3R2Y3dNVnluUjl5WmRyRWtWMVlpR3NBL3ZFRTUyaUN5ZTJDeGN6?=
 =?utf-8?B?Ukx6azJ4UjFveXdReVBVRlVIQmJ1K3VQRFJBdEFWc25kRmw4bU9EQUtjRjlE?=
 =?utf-8?B?Sm9vc0tISVhBK1NaQzVROGVDV2FodTEzVFQ5S1hPMUJzZWFWVnNuSCsrRGUw?=
 =?utf-8?B?Yi8xdFAzbE5LYVQ3WWhmN1d4ekpXc3E1ZDRHSHQvbkRmWjVhWEpqUT09?=
X-Exchange-RoutingPolicyChecked:
	UD5phM5QNlxY/0OJoWVzgNa5U/uI075OzAI2vF+y8lVSjrRtnCu03V8TPsUHbIjgLj625fsRko7Q36wdEs+s3U5BHCJGYDWzXnWnNTiH0qiv9aIjwh/RQhmaxGf8miIyFiKQnI2TgCBpAW17y4X+TQUebotLekd5Wh7vyCnPgxR8jrno8z7N3sCNYUUBVWuo5G+0DX3qhT5uBp35lqN6IjEqafXaHGZglPgEZtARG16LR6R1EbcrkNkBZnG51s5uGgj8kNo4CkztSmd99nA2OVqF4CXlOO4Qb2Pd0GE5rtOsRe/TfrAz+0oGv4EpWseUvCl9vsy0RNtMwS8qmWgK7A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RBb054nK8r5bJNRyqx/89aLTb5m2WANlrIKH+JIKoVmX0PokaXb47RG0DYbbKQiXGuLVBJMZ0cy4pWoFN4G9Urokkq8sst80Pq4QPCtbzQv6v8TdPqQXSGF7jSzNIP7bGR96NxVN1+ZDFXQt1EfSvlJTLuVeGJ7DNNXx/FJnnoRFUxnvIz7XJnYldx6cCcErK0TCmWf11YFaCzpTsg+PpNQrEjipDa0Z8wIu+zVBQFne249PU6GwrXKTY6GjrOhNAnw+t+jL5lL1LtJKAlzJbGatqO4zUm8jCzHBcs6mjPlG5s1cl0iDAEi3ZWzCq13Z7uT3gTQWf+LtuEyuve+LX4E4KGl4G/nnCWvTLXZCsL8jjX1Qge8CMYWMejepc3IcuStkpoc7heysEOy6uDsGyiMmlPN4naaE8CXxKgnWiU1kXz3arq29PTsXeH4F+q5HsG9lzZQNCG0UkBBMj90oVVLZriADgyKTPjp2tGNMBNNBU6WiB76CLgruVpdfci3ldWT6ij7Hz0CT2gFIivnc9MSYP6b0YZYtYnN1/SIs5ZrvjC7fXJXNWMpNyKXxIW67puaCjR56CPqwPL+R5g+QS754WHWqS6atBm8hrdYak6Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fcda72-de0d-4233-6252-08de8ec13171
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:34.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYw3FA5chh9YoBlyypr2ktM1nB4mSsdTg1UKbwSYAGlYTEVbWCFcCRz8XH9a75XjbTmgWy4nEigeVYNMfhdziw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603310007
X-Proofpoint-GUID: kXhP3AfXAvyd9z8dLvOGlERv6EfBNGne
X-Authority-Analysis: v=2.4 cv=G7cR0tk5 c=1 sm=1 tr=0 ts=69cb1d31 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=HtUOmziM2DIHkcWw4q0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12275
X-Proofpoint-ORIG-GUID: kXhP3AfXAvyd9z8dLvOGlERv6EfBNGne
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfXwK5X+HekL9/A
 WVAUipubp1hNUwCmoeDB9hEB4QjK3Z+JyPRGmXno4GYQNZ2Uix7M7wfpWDN1rJHbsCl+yWWT1zH
 7qmsSKCCtrBnWVO4JcOjzY8n2KFIyoisXDJkznJ9JPEkrjhJUs+mzWBWVWlN6uRIctx58eZgRcs
 hHZHfqB+2FQPyiq478hWc+0vQAULWCO+mAe8SZRR9EDii/HHV5AM8M7fjMurCrR+DWee/yNNWlP
 h7GBt4o/jXzhpuaHQLZlIkz57FaiezQaLIOjFyHFkvAyGsBZVLcMVOgAR2q2U7uKyB9Plud4FV5
 qAiIBt4CBdo2Ug1IDTqkTr6Gl/GmZxaBWY7NHJW5XpfbF2r6XMQ2KrYvGM0gW62LxS8TXpnscT7
 9Reudyh35tB5UwHywLY5M9HeiGuTR2ge2hSiVJcNRuFhxBQwiDzF8q/meFMJU01jvsXMjDPFLvC
 JP5U1aACnlwBv5Uzzee/gVApgwQXI/HQU+4yzZjU=

From: Eugene Loh <eugene.loh@oracle.com>

Some compilers warn:

libcommon/usdt_parser.c: In function ‘usdt_copyin_data’:
libcommon/usdt_parser.c:191:15: warning:
   ‘last’ may be used uninitialized in this function [-Wmaybe-uninitialized]
    last->next = blk;
    ~~~~~~~~~~~^~~~~

Change the "if" check to make it easier for compilers to recognize
that "last" will be initialized (and non-NULL even!).

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libcommon/usdt_parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 864198098..d8cb9b7ba 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -163,7 +163,7 @@ usdt_destroy_data(usdt_data_t *data)
 usdt_data_t *
 usdt_copyin_data(int in, int out, int *ok)
 {
-	usdt_data_t *first = NULL, *last;
+	usdt_data_t *first = NULL, *last = NULL;
 	size_t cnt;
 
 	*ok = 1;
@@ -185,7 +185,7 @@ usdt_copyin_data(int in, int out, int *ok)
 		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
 			goto err;
 
-		if (first == NULL)
+		if (last == NULL)
 			first = last = blk;
 		else {
 			last->next = blk;
-- 
2.47.3

