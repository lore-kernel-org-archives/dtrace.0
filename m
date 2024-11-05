Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA14A1E5718
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 19:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834993; cv=fail; b=IY5W0zk8Xt/Qc8ep8QafM9K4f1v2HjG4i42q9gnjljd8MkAz0umIWWpyj7EmS+fxMxpcC5qgamaBcozhvLlXDwUzPkfiZdzjFI5MVP4dBOiK5RBgILBa9jAF7wjVB8vwN87X20ZVBtAytBpwFAcsyYfzvo6cEZcVCC1h8ARU5Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834993; c=relaxed/simple;
	bh=4hw1OqZ8pmwZHx/z3TuMjVEm1FpUhqJUihN2RDNAfHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eLARSnWD9Acl5rR69iW6v/SuHVuNDgjgpzBhrqt1KXQAktVNdHRce14oDQKmm9cYYelYdo8TSQxTiSmdEJ+GAbfJWkmL91rk9BuPbBwzRVzhcEeo1hSBRqUh11hqcb6X48yfOU8MXhuwhF2YsJlINMudK14BAnqHBw65j3oIxwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e8onl2to; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QJhARJlP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e8onl2to";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QJhARJlP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5DiXCH012632
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=0vjz4Y/fca7i7DnEyY
	dbWrhQKcuKtOYh54BgPOshOjk=; b=e8onl2to2trXIajWXsFHbtCKVEQcfv0ajW
	dNoCiDeMTGOC99KM9kAi0r9ex8ykhRgdQtbAQN1jotT7XNNJh5veKoKZnMm8PMQV
	1c5XNqHlcWPqocoA9vCZyiO6JCV440RjBIZXUREZ/Cqf1b+QR88L03wuQvhMNkJm
	xsSsk0Ye2LSmRLQcinWVqti8EBU7tOKNFkn4UqlIiSKLxHmRZaRgF2BvLNfE1GeJ
	ovmmmwJetH/Ekf38Y6PlcOaGVSSMGgG/yVntk0tF6up2iKBMBDxUONQQ3QF0wZzX
	bor4Z6pbRBv0qsrwuMynJbMaDeg8aEx69q84iPKu6UAO3mUteQuw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nb0ce8kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:29:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5I7d2c005116
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 19:29:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87b06mg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 19:29:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpIo89FNVJ50MH1QEV0HydFPCfFNk41Ut5D3lhL90SY3ScvckQtjL8EG2daZBcSu4r/D/Oe7FXWORW3NdxTSP1r5gpU3342zmFNjU5wqxwkHdAz8ryYkpEC3vlMcktaqL83r6/TTpamBywPYxwvK6C80R40t9HyohpIlpOpgI/PM/Sa3GDv+Gt25KP+sXalos4mBTqJsosXxJcVmB66Eu2W7pXqqS0F3rWM4+tu58gX6iJWBFBwFiaTMSPxmibhc1VOXLdz98hBIv+V9YXSDUCewrC05UpKA/5nGzWY4nVjkff6VRo/D3bTE38tiGrQq10MUvTqxEo+BBmmBQ3zwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vjz4Y/fca7i7DnEyYdbWrhQKcuKtOYh54BgPOshOjk=;
 b=b5BY6dfNniEnnvIzDLYDn/uaFMXird/YOTPFHnkpd8CJLPBK9JGBMPOLDDbphp69HdJ2SNbl/OkeHWx/tjs8VbjPANMrwjx5CG/OtQgVH+lOxdxE2rlcmqybL6Ag8JdpwqQJQ5VhIhcbFRnn1YtQPjl0/ZK0hkoTDia+vhb5IhiRHnPLPhXvQPeOfeE6MTejeAvvyWYnYQF77hCSnnxMmE8w2LFLsXMjEyiNQ0asWipl8FPWanF+oT3W/ETXDG8sa7wX5UxRNd7+0oUePymhQMaO/8BXCwh8tFm79XXRteOOF1MYbJdd7j8Xu+sVUN/8kBHw4032dTebhentmXza0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vjz4Y/fca7i7DnEyYdbWrhQKcuKtOYh54BgPOshOjk=;
 b=QJhARJlP3HJ+i1opCChWDjfMlTzdqVdM5q9tJctiozRwx+5BEPsb4BvSgRe0Zen7yA8o3w9hi/Mnnh9A7L9fcc4XeXpn90S0Yj6ci7mcro5uOKhQ6tPlUtsJbCsiDOr1BXIXMvqK9KB877iwO15rc7QIVc7btVjI+2cxtBqYSC0=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM4PR10MB6160.namprd10.prod.outlook.com (2603:10b6:8:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 19:29:45 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 19:29:45 +0000
Date: Tue, 5 Nov 2024 14:29:42 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Remove duplicated check
Message-ID: <ZypyJrnIfntKB011@oracle.com>
References: <20241104192354.27566-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104192354.27566-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM4PR10MB6160:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d22a08-ecc2-4ba6-b372-08dcfdd03415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kbmukX4ZTDMr/tcW2eCYCha5H6vNFBZczZRfCFsMmmbusm0S4rN9FFjN6FfA?=
 =?us-ascii?Q?DkttNPyW5c6grLlBWyduB8ebBwcD1jXaRTfbquSCwTxmnJtxOg9LSiEtqHWf?=
 =?us-ascii?Q?9dS25T75/GrpRWZoW6fWJ6jhBkP+LAwA/TSuKijDQAbsbdFu15jLy4tGLWMx?=
 =?us-ascii?Q?lkauUcLItQKbMD5zXs6doW6gO+wEugoWWA6efRPqOnfGLQ7lBPlBiQMYLJAG?=
 =?us-ascii?Q?TPjwS4P2073PIFkycyZtx8cw3HyWzwNHe9/GtuZuLiqCI9l19HFEQAgq/Frs?=
 =?us-ascii?Q?+Fkr3hK7sH7vvYR0VugotlL+d9kYrSEURZASmnbE4cxcHUMGAo/vaYCFOkC3?=
 =?us-ascii?Q?fhxICpijUsZADu8gjyOpK8Re/gIbUi7gg3p3oiXI5sORQ0mKNF5uOr5BMW/0?=
 =?us-ascii?Q?lE4TWqzUZ6UAfZWZ3L7Aaj5MmbaR9PUUpOFQ97xblfB8jlijytiy3vZpmkPK?=
 =?us-ascii?Q?rfk4WrvTnaa5/O4N+Wh77qfFat2+dK3JLD+JK5q0+2o5Q+HTRTQz15RBbYPE?=
 =?us-ascii?Q?l6DR+G9YaElAnMGObccc0KrP91qKuK1gY7MZaTdNhrSY7KbPCwKkcL3/nyns?=
 =?us-ascii?Q?7ORDyEEUOTDP2jc7i3pGZyd/1ODp4DizQsYmw+J/eQLrL576Fq2ARxGkWQxn?=
 =?us-ascii?Q?5k1ICG8QFghpiEifLobLDhAKK9pag6FkjUA6SCna+pK+AIfxF9lg5WLZQCNU?=
 =?us-ascii?Q?2Wq6620K1nrEyHdBBYVwYl0tFVn1VBUDcJnHBI7KzsshPpqWPPnyDTGlQpak?=
 =?us-ascii?Q?9dRV66Te5p1hnwWjjsLy+BwSpW2Br2IFX1Fpk1J7FzaIQwUG2gKU7/o50Iwd?=
 =?us-ascii?Q?C1FjfnMQQNmtqBCPzxMIFGMpg30k1HIWTjGI6E8RsIcmJkaBeVhk+qN9A0eB?=
 =?us-ascii?Q?wgw0/6CCUOo8l7+3AsfXSrZBexhTScRQZ3Y2Vv8ajR6hSLpyahHGRCQDXxrJ?=
 =?us-ascii?Q?+4ZpzfMfE63mAM7iCftGmHpOiJ3TtiDO7elTwNq/z2IMm72+k4SuQ/4bnqf1?=
 =?us-ascii?Q?KI2ZR8HLo2s7T7e9X+rWQKQvZmsJ2x6R5OuQo1JGXYo9n2yw8Pt8VvBJAws8?=
 =?us-ascii?Q?NImA5EVm2R7V24rQcLDQ+A63X6rJOPjhLTkuM1RjNfbL+aemexLjnapmzmcc?=
 =?us-ascii?Q?/G7zXfcOOUSgkZhoo7r2U6/yUOhBum0Po2Y8IXjDcmRfGclbddfivWKNErlB?=
 =?us-ascii?Q?asyYanXlElpWcahoBgJRp3D2usSyO9hoCvp1z7hI4CYEYtZAtxG7Bm/SYyUk?=
 =?us-ascii?Q?goE3bv8YogS7bGeQQUodk69TwKyL79q5IOuOE0ZmlY2DAcTX3PQ2Zr2NUq5y?=
 =?us-ascii?Q?TNvkOqOTDbOE4XzeIJ3TgsrV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?olJ/RHKujdBILCkbGv9POevLdzPJNF3Nvygg+cxVL3yIAExRpzqAinQH6/2W?=
 =?us-ascii?Q?Lo6repsSjjawcH9ZpeT1Ihz5EmcjtH5RMmt76sMHLoUMNlqW7f+7Q14esgpi?=
 =?us-ascii?Q?xYbmP7NINUOutoB/gEPDWebvNCXijNjgVWDtiCzOZN97eCWD2gt8ajkH0rxp?=
 =?us-ascii?Q?4bAV3aV3YKKASxnUHAtrJHC9fQhiEXJH/TqIKfbYj1rtrqXTrhaCt3q3HC87?=
 =?us-ascii?Q?+YMOI2A7rCj4InYns3qh0T4+yqpA6LIrqQLQtwGIAEpqY01ZpUFODvRRkEVh?=
 =?us-ascii?Q?Q2/o5P3JJrtCtVpbervvvxvXGN9TC3U8mG+Lrg+cgElBBPXupxmlkRtw+WvY?=
 =?us-ascii?Q?abqx4k1qiSXgR0f80TdW1uCbTljHl1ulWNv9cwFtkUXG2+BBN6wOtvdPwWdv?=
 =?us-ascii?Q?VmfM7Mzjvnp23w2CTGHAQz8fQ06PxqlvtIdXGwSstSt0bZi0OBmGC5lY5V15?=
 =?us-ascii?Q?k5jvZN2OhrIAKpaaKozk1IJr0pAcbvXaNQ5/SDxEBY1V/ZOrh0AkfRduQGqM?=
 =?us-ascii?Q?lgrl5Aw5Uzs/N0Q+nkcUPPFuG+hjtE5rQnhj1yMKr5qhsF21VbizlyfYD9OJ?=
 =?us-ascii?Q?doS3qdE2Da0ukCbyA0MwoFXgwb906TYOoZLGcHuPIEnBWfq3aBr+oM4j8o3N?=
 =?us-ascii?Q?0Gn+FLanG7GTED9CMB+uzyaFIC8MBu9hsFcdrvvsedBZT55wjBYJLqLlwNfP?=
 =?us-ascii?Q?cQJuojT5v2KQSt4B7ieMjxHQU3tLNU7zKPzXJHqazSmpmw1KNQ7LtT5lw5jv?=
 =?us-ascii?Q?o1zspKFboNIuaMxpXcA/sVLukDbEfVcxQbb0F1keYAuUYjj4/9A7DMs69NTZ?=
 =?us-ascii?Q?99qqBjwD3CEMNwsh2yWjX6R22xBpSmM5t4UDZidSVby4Mdb77gZp1+Rs2I35?=
 =?us-ascii?Q?ecRqJ9XT3XyCbFokeqqH74+32T7eHK2LLjN9wJZ6e33zk1zVpa0gX7bTVmug?=
 =?us-ascii?Q?Y3x3LlmcmAM5UMJrREY4uf3v/0BcaQpcOIlO1qAXkNi9Yx/bb9/IJNNkaJH5?=
 =?us-ascii?Q?zcqMULZiAWMbIOrU4QP+ZdAxie4mfsR8d5i9KbJ5fYb4Ic1CqmfFMn8HBq/n?=
 =?us-ascii?Q?KeP2/S2uxcoKWNqeaREw4YIuEp3RZSglEtpJmtiZTH5lC4kBupzCC6g9pHw1?=
 =?us-ascii?Q?7ZppBRCCLsvkCsy/Aip5XDSIcAsTm+bqyKjuQCeZ+d3j+s+d/XFYO/lu6wnn?=
 =?us-ascii?Q?qiymRyCXRRcdQWvHCN9Y7bto2c2kaU82CRdB9T6t5+kKxmbBDJLop8guDI6/?=
 =?us-ascii?Q?Yib9g94X4VUaR3Up5L/1oMZzg/j0SYQqqjkdoAfdsArkDy0FWJYqhblMYhyg?=
 =?us-ascii?Q?N9SXxev8WgrMiwudaaHLxU9tI6Kov7p6GC3tS0HJTprO7fx1GNzOkAqVDHtv?=
 =?us-ascii?Q?5QI92QDD0Zm8pTR5tThozL5TyoPvqgK2io8YH+kpYK1LYnZMJU9nZjSJGwsM?=
 =?us-ascii?Q?i0erBudnGVxOodDWZTHsIjcvldz9bUz3hl0HOmwTfXCW1wBkl/XssuAgvj4F?=
 =?us-ascii?Q?ZJuRaq7cqh7OrGU2pHC9fc5F42WiUKYiAQ6LYz6S7ml1mfa15wafno9sJ//w?=
 =?us-ascii?Q?IFLqVaM3ZvOHEXsY1ol8PuslIx9VFWvB7875zNJ82LNgIHaS1Y8lWEzuk57O?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3v8vXhskY2FYoLM3RxKZ4n1h1Rcnwop3vgsaLkjfQteSk6impk94w4rUpTgWrFQ8rzZbm+xo7/D3OQocJbN9e1blhaxnfUIw7eJTkjxozpvcy9/NIn1m044NLpTOZ8aZeQQC6o5a4BfkFyz5Gm9fEepe3B2frE4Lhm28felqssCdmUd8FDeLsQQvv0AmPiAI7Zk59ZddV8PMBgrPhckkKX2xFZtOVTK9zWX3dWuhIccQXeMwjFe7ViLHgUJUfTGATUFHD1hslUSIBe3tXH467a1dSh2tGn3QgMGjYw8dHb9R00IFJiPTBGGyw8xmcLdLFnX8k2Yg7U/PnJO6g9qyg3FXsvCWUhtZbxdnM+wG14f32R3mXOnAfp4suZz4DOL5khCqeiLEPFfS0gnmWv6BugoPs7uaXjjFLnH+8UY5dagpo9XLglW6XEXnpqYVwlfxqHCGrC+K8vHVQTGGBETvhb7lS+sHT1vKbsskkgwu9sREXcA9PeCSIlel4PGVooDL63KFmL5QqIS6o6rHXoVmUIBejO6nvruGZd1UrzTRCO51m6jqR3lj0cl3gC4Ag8tMX+z4VZA5AF2VZbx96vo9+drSDcLuhsMsHwf7/i5glpI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d22a08-ecc2-4ba6-b372-08dcfdd03415
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:29:45.0353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCw9dAHE4Ohu5sDYCUj8h6D9x38d4M8azWUyG8ybpSEnw9cqNAJztotw3BgbYAYu6yVKzQB0L/HaOD41k7RPi9v8zQlVwnhyMGElXUnDvQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050150
X-Proofpoint-ORIG-GUID: Z0VEua6hDOPeTmNFD5kYISQN2cVBBMua
X-Proofpoint-GUID: Z0VEua6hDOPeTmNFD5kYISQN2cVBBMua

On Mon, Nov 04, 2024 at 02:23:54PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.pidprobes.sh | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 8d18c89a4..25fee8553 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -99,15 +99,6 @@ if [ $? -ne 0 ]; then
>  	cat dtrace.out
>  	exit 1
>  fi
> -echo "my result: 10" > main.out2.expected
> -if ! diff -q main.out2 main.out2.expected > /dev/null; then
> -	echo '"my result"' looks wrong when using DTrace
> -	echo === got ===
> -	cat main.out2
> -	echo === expected ===
> -	cat main.out2.expected
> -	exit 1
> -fi
>  
>  # Check that the program output is 10 when the USDT probe is enabled.
>  # That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
> @@ -115,7 +106,7 @@ fi
>  echo "my result: 10" > main.out2.expected
>  
>  if ! diff -q main.out2 main.out2.expected > /dev/null; then
> -	echo '"my result"' looks wrong
> +	echo '"my result"' looks wrong when using DTrace
>  	echo === got ===
>  	cat main.out2
>  	echo === expected ===
> -- 
> 2.43.5
> 
