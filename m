Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D325D1E9
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 07:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498355; cv=fail; b=ViwXTIc4YVwkNCbZ6M+W/1xijfjTM+DpSX2V8hx6jkQ//X2auBzbMyliINBL2wtkuNnNaEVH27nEe8GGCzr4zzcDnprQ8DDXpJVYaWJmdCdFZ3yoyqXx7GEP/7At2xy6bhYbqDDSnU440EwLRl+0Sxp8/W4riebJnW5kmT+YGco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498355; c=relaxed/simple;
	bh=fY4c8XHXoT+yfIC50cDpR9gddos2mOzytlE5RGzbimI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=lC9YvmMgLAY2qw+/c7cmnD4wVcmPZBO/WV/FBvh1fznMyamc64+c4qbwaSKaX7JT4alMAT6LZ2xwj6OHddFhwXQs5ehLcFNe3Qs7ASjQL4XRn6YWJnOEmIpMJvILJdQtDU22VkvBBh+5zc78Oi4iOUFr+aL2EG+ACSBMr5eSPV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cdKvl1qG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=trKbNGRN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cdKvl1qG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="trKbNGRN"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QNlRtp619897
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 07:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=vdZ82GmlSRXWP3DIstEa8HNrfI2IEbMrA/7teX+g8iY=; b=
	cdKvl1qGzlX2tjylTZYmhpcMgybrztWsBIyuwGN+GbUfOQ7VVd2WG76ow9lrjbPn
	HwghNWNGWmsbwVnfnuKIC8RGyMYRQtnoF95+xRxxZAyZ00uaz32drTdDG56IjxAC
	YCw71HICuOksnp6BkFNNiSs8AQlu+aT0Ku6oHwmg+wO7mZ1QZ2MDNhjUaCMqz2Eb
	R70HOz7VAnJym8ti78D61jISsH3t+rgpTHjGFNNl8klvPgAKmJd+ch8wXTazZqEm
	fX26avKTlVmLbekqSaTVoxXAyiYnVEYehGppMNZwNVEe73Uc+4KxVk6ZwN6yMs/G
	fBVZULiHAEVCcysYdy2cVQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6ug8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 07:19:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60R6eEmB010180
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 07:19:12 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh91uby-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 07:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8WXo4/MJXUJuphl+Pc0Ok3Eio1nHtdQuquCTZ0UNyyNvSY9Zb5cdKeB8yiV5zBjNk/+d2n6DoyC8J3LRt0TGWuGd6XxZ0DYEuB6uoh2ng64YVG5vrfoC8Y70xgTOIcOARwp5174PyxT/g/rUi7dx3B40w4J21MAelB5aGnHp+gQqGU2owOhqeYBgp/tyentnAVcDWc1dYKttRbZtWukJWnS/jK60o8p9jF4+k4kw7VDKFzfFkE8nnE/0nreVvdKXWsELVon2FB8a+PNAF+ZN3zlF1jX8DuGST2RrqIB8Rp/V3AQLwH13O8mVNgltD5pW0aONwxxEHtkXW2gltjiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdZ82GmlSRXWP3DIstEa8HNrfI2IEbMrA/7teX+g8iY=;
 b=fESh/mkvesCG0XjDl+dLucNZbC25PZYP5U2qg0bgfLynNbiYPNLejPToqDKM3MAHosdG+YvMC77MLlMmsJS43ZsrQ+7TuM9AIygr/fMm48tfXnc/W29iuCfP6NlDgvzq5RJAUpc8v/9N+GPRQ8hSnP9NyYLVoSKEQR+juIFSOlJkvuRHTegMVi1Ysh3MPuk/rZyAr29IdXakKK8zydEQGOosdKbIQZt4TaXvZCplTVzEVtNnky8o4rndrW7tpQ9SFUw7HZtf3NxwIjCjUkTQ/9MMVLJySttptim56KioynwOnMTjR76qHUNFWJ2p7a31IG2NpW8aDK1Z82rvscZhhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdZ82GmlSRXWP3DIstEa8HNrfI2IEbMrA/7teX+g8iY=;
 b=trKbNGRNbplZqlhdHY0wsG1YcmZcFmWmYrIn4fbTwA/OdM4ezHtDfergTgjgfV+cvUp8VRISlwTgKbc2PMJ62oU8UAywsFXaI+7PkiAf23eiU5NWablinpoTIZqqdeT/SDSNnVXtt7ao3YLgAQzG1kwc8usmMFI8EQdA6wBcMA0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Tue, 27 Jan
 2026 07:19:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 07:19:08 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Install stack_skip_test.sh
Date: Tue, 27 Jan 2026 02:19:06 -0500
Message-Id: <20260127071906.27280-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0009.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: df6c7975-e6d1-4487-9265-08de5d745cc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PkjXGX9tMefUH1iuxZVSEq5o1agrB014UoABRSeg3AqykVWNoZyL6BTuOimH?=
 =?us-ascii?Q?Y9egNo5QR3WY9NdAfvSPsTMqvqdbnzpXiK63fQw4MS40F7wka9Ee7ghaelX5?=
 =?us-ascii?Q?jKgL+Cj8WvNVGGsf9YwIgbuWI+eYVsRZMPvsV0qXs0CjM3H+WNU3SUyyx0k5?=
 =?us-ascii?Q?zEB4ahnZ7jAQFccmRSZazQonWs44Ml7GyHBb0QBp7xLC7PnozgfoVtxsDqwk?=
 =?us-ascii?Q?xK+Jaw7tDHJrguBb/MknbGCPlhTmKc1FzMUKgpUrwpzRWaHTQLmj4fGjp0eg?=
 =?us-ascii?Q?FJC/EY2EzRKA80nr3MBN7TTkor5wsKhUpf7DipSndkx0VJRtPLrfVzgd8b+l?=
 =?us-ascii?Q?gFjekYb/rHwCvy2gi6VLmWLOn2NRGBM6LwaTEu72bCE9AX3bBQbZ8LlOl4RQ?=
 =?us-ascii?Q?CRodm1oEUboNlrFW7r+/He+2zXdX/RBYdX1azRqjRM77D1qbC5hC4pLiQ/Q8?=
 =?us-ascii?Q?hEY51rQirusZpjUTl/BnYprv9+5xieXK9kAuzDxv3ZWtFxmwkTbt3r0lXmsQ?=
 =?us-ascii?Q?GNCGCWx0QBP2zw1Zb8ayAkDQYHCdlwuiBq0pizGmzIwlkwas4n9LsdPB/0jJ?=
 =?us-ascii?Q?8krrkYyapeE4q53ZfEto0xP1q4ifI/YpCUlsLZvPRZSGN7gUCPxXzkFUou91?=
 =?us-ascii?Q?uYaVuXiLFANj1+gpOSdXQnYR9zrmG162vprDLHzxtoMPe4qYYjkqOYzu5MPQ?=
 =?us-ascii?Q?WsSKau+nY2a4m94f0ExETjmhgkWQiSHucOXaFxiKQ9h+hiFq65pvnNe6EBv9?=
 =?us-ascii?Q?kVqZJ8X9OIDBAqlt+Qn0CKxSX/dXS2qmtQMpjMtJcGavKhMrsWr1OX7YmyBJ?=
 =?us-ascii?Q?pqv3THaCjZLgUdPrQ+/eIW9XVGQS5Ftaa2Dy2Bnua9Fv3ch5n6gBHpop0GbY?=
 =?us-ascii?Q?kemJkvy+1+MSFB6m5fBdrmgFvldbyz/3KOT3dp/GGahM2ySbbojQEbESqqnF?=
 =?us-ascii?Q?5so20mAPveZ1plIDY9AnKSL6PYeZnv+tHPTBXhW2E13DC3KCmePWCB78RFww?=
 =?us-ascii?Q?i4B2ElRXRUJ/V6w9oP7a2kAIaNSzrwVMlxYNiw3YKB+9hOcRRCEsmCvBiTcB?=
 =?us-ascii?Q?xcB20PfKqh3YgGZWQDhibY1QGBlykdU8S3BLqs9r5I6iar0P/Qzo5oP7SFxU?=
 =?us-ascii?Q?qng1HHOgey0A85L6CHv0sXpLRlvxPollinJ4G7kyrr6QTw923QysDb1OeZ+R?=
 =?us-ascii?Q?DbnuySL8+KSCLi+uDE18QHyQnCqVPoDFBpM5hUoLAIXsD3oJFMG7va4KcD9M?=
 =?us-ascii?Q?5eKt7QuX8BGH0sNrzm7Ldx3enKp6J9ghIEYAsRtmQgodp1euqc7VgKmC/wJ1?=
 =?us-ascii?Q?SAqYewOIZO4soO3jFecaOi6SAdA0EBlYGmw79EcxZ6WclBwBJqQvB3/EsFyb?=
 =?us-ascii?Q?ihPes1th8VeEc7ao/y0GzxNCjDWen01VhfounROpfrpsMW8H5gS9SfyekAjd?=
 =?us-ascii?Q?8ji+kmcT/fXFsgtwydlpncyt7yIV+NN5dl0rPWR6bFjwTt1o45HMHP+tFtvc?=
 =?us-ascii?Q?BXiPgG6d/Diuhdto78hMh5pl3zLpNzgYKzNZzDobLBharpWZevcn4OBvbjIq?=
 =?us-ascii?Q?ZAKX/HiccFACGeesm/tDIhzzaAStQK9c+x1PEIEc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IRQV5/9yGHoD6wzQ3dtPW2FYHfTpd6GvYescF6qifuOLOhrLH/seJT3umo86?=
 =?us-ascii?Q?fykmtY3p5Fq8nyVGFsMJrfTXN8YSf4eZ7yEysukg6rJB/ra30B4yd9RoVTHu?=
 =?us-ascii?Q?Kywexqxm9HgJ5UaBw/AHFq6ghSjiPw2JzPYKGPI6tINAouxTEYFwVdjrgpo4?=
 =?us-ascii?Q?gp7fZlcoUS30xSUtNhReBwNPTUxNvv2RYUe0M47wfca4CLNBTLhIKKk1JnEm?=
 =?us-ascii?Q?N4B38gLYuJWx/AmLigy/v7aFOlrZd8OGB65xJqHJmb3L/ezlouzyjB2Mv+29?=
 =?us-ascii?Q?fR1752aia2QcDQPAaLUXomyGDcU3pD/d5pVK2gPLy0BBgstXRYvANey7s9Ng?=
 =?us-ascii?Q?hP0s+mO0zHNdZjB3YEmbyisSI+MDqebjY9ZJBI1ViRfbmN/Lo4wf2UXx6Umf?=
 =?us-ascii?Q?IHFA+00cA2UbeIDOnoPBdQnMQDaW4zx22n+Nn6xhfEDW1I5jckpHWAn9O42T?=
 =?us-ascii?Q?KjrixkvhMD5MwcN6PglBmkAj70LBIhuTQTw4dj5THeLPlDY5XFSksYKlu7p0?=
 =?us-ascii?Q?PeyP7MJ1wWGANBiLmxL1DNKwNZDJXKY1Jz7PeTPO+lN/HE6SKocaJu0DC8sP?=
 =?us-ascii?Q?A/iByM9/XQ7ed6GiInkPo9Cc/HHvFQxghUCSg/lXZC0vFPDrbiM+2y3baZGD?=
 =?us-ascii?Q?PGKBp05fE05P+tvfOWKTuuX3O/bhl4BALWLNul4CKcSW1cli5trKGQesulYg?=
 =?us-ascii?Q?RPGcZdAkAvyqDMDpJ9rHg/PuBKpVV7dELRnSjLRgoeVEDMiliWAOcDEDMigb?=
 =?us-ascii?Q?HHJcg2OucG67iL0AmMDhMpXPEQXLwUE5BHY1mKDLcYIOuo5mQFgNUoKblcx3?=
 =?us-ascii?Q?jIFitYwbHhp9LC29lAg3aJBEnOKxOZPJJ1/9TEO3J7bIMZ9JzDy6cF5nUNoU?=
 =?us-ascii?Q?2RlzyUcr37qXRDYp3RA+/2SPDCU6M5fLLaIPg074a4CHXw7+Xp2J9edLj6/B?=
 =?us-ascii?Q?QWla2LcbzZGm8uuN/gnm30J8U4Rg5byxOsgYWAiTJeOQRvyzTmgoDB9voMjj?=
 =?us-ascii?Q?UxCNg7rW4Sc1RMyU99ER1OUhpJhB6taarxlJgzS8AA7JVkGlPVI6kNDhWAeO?=
 =?us-ascii?Q?T4ONSIwuN6uba319iX5Os9bJ88Xork0DGiZozkKpWTTcA8zf4HQhDvT/ORS1?=
 =?us-ascii?Q?owhg5Kqg/eq0a2PioPiLeUTxb0kuhlzQboOBmqLUbq2xrrdahRdbBFZYdz5h?=
 =?us-ascii?Q?EFCMlh0J9/e63AimMwDhSd90rbMhqfS3ohvKurBN/FtpXrc6/b6nH/UqlNGy?=
 =?us-ascii?Q?9BwLu6bCg37G1htuQEsjxktbrm9SY+Hn7LBpX2KjnZabUwI8bIkaEn1CMthq?=
 =?us-ascii?Q?7esq6iwK9NcFXbTaNZugSeLU7UBrbw88IqQpJ4Tot0uMOElyDxJtBJWAmZk9?=
 =?us-ascii?Q?fB3P9BqQqGyHbqwkUBIoNbFUz+UAkCAHYnIwZgS8sK03mSj/q6Hw+8G+KbeZ?=
 =?us-ascii?Q?9+wXnA/K7bFiRMMrsx88tmnuYZJj1czyFanzbS7f6td+ZzFOk3RScmqcotyk?=
 =?us-ascii?Q?u5nHz2UweLkbTZpSlh6ag8wQWFc5uN4YyfmDg9xsdI+wWZnL1ug91yPD0a+R?=
 =?us-ascii?Q?B5ZszwVAibcuvtodbyTkYb+QNzR3S/5xMB9WyZOiBfmRt80uNu2MxadfuNyE?=
 =?us-ascii?Q?xfrdLgZxb0ti7O7x6AzR6BGsRvvFthDImX6+tgeVNLHc8+pGjekTU8+5khUv?=
 =?us-ascii?Q?EgOZWE360/WOe8k26/aL92thpIC/jTCd9/4JB03b1s7EjmgmwQ2goRTlEE13?=
 =?us-ascii?Q?vUsViW26cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ITeY8iMrqsQq1GbX78jIJAz9f9e4S8iGv53RBBWjiqWdxsYrpUcA3F+RXM+uTN/xIOMvQnnXCfrShDxBCJAbIo8Es/VEqkM490H71EgBtYDK2JKHuxY50d0h9sgiBGEqArmxiKC0prDzLnHQUQuFVAYAUQvckL4XGeR4QfL30aVwdKKXOt70Y3Ux0kKnUbVLZgwUWVyefHW3T1E4Fl8oiT61hrS9g+etn5NyS+nHgWVmsH9n5XesvriSP/UYMakhEBNCaCHLwW+oFTG2lPoDyJOpjifVW0nqpmHpL1yWmmrdBtf3cNjAd+kS1ISaNm60RGqDC5W1n9hCG0TKuJctarvOKwgqTEDlXKVu1BoSliYqzEgB7py88kRirNn2x9s+GXTpv4lQGoyh1U+qFCiOrDiNQiHCfnxGAJ83DR/HuQxUXnlY/6HCH83dEQwaQq6DbZ3l4FazDq5pqEac/3EB3wdDKlLLIu0CQIV2/YMj1Q25rU0URZ/NzvxcuPlDGhfkroiYoe9iv7W5ju6N+a4KHYFAj7ewF+pYUHAzmDQjXcqMZ9qe1CG3Zs7ktdO7OdL8iyxBbozLxAKyJPZA65/3mc4119auhwXFqN4eSIAPcV8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df6c7975-e6d1-4487-9265-08de5d745cc5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 07:19:08.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPmB1oL7c9hdngyN45QVw4kW9v79vuKuYn/4xYOVZwMqNn3Ym7naBP5X7KJxiTnABq3HdxIQNPh6tbUA+wmong==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfX16YSvt0HjMT1
 7Ct831sG0JmXKH1O/cBcH05VkeiLADXaKanKMMRxngXSfbtAZIEinFTJPCYgs4RylQoQJC5fw6/
 +TPz2qrIZQJOQI79kAiHb9eTdv1iDO0uLwjev+3fb4PsOs4TaStveCoWZlHrPs7PP7dEjja1rXs
 6zYLguLsykYqc7iS03u6H350AkpL4hdeR06rjB4VElH3nC+erPdDz8cbifAjH2pq/+LGuhGuAkQ
 8X/D1A04G3sDTcYNZIB9eF9DKZdwckuGeZZbvIyBYxcGa1u4/7oJ0HdAftEAo0k4NavtSsCWsdO
 I9tPdmsn7ETy9Y2aCzMkN/pKSjJuaUEr/Ca4Ch7Gv8JDZ2l1GvlE7RBfDVVEnL7y6EM4Y/HSoPe
 dkglTUwW6k/O5W+qAW72610cHwGeYpoG3g+zYkiHH71E+txVsIFUsqh2G8G2W7qSyoFdt6lz47P
 wAz+UFxdataSZ5rtoNA==
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=697866f1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=DT3lbz6t9-JpfObXJVwA:9
X-Proofpoint-GUID: vTrm3KNZXHWLHlqt9trE7BXJSSFElyoZ
X-Proofpoint-ORIG-GUID: vTrm3KNZXHWLHlqt9trE7BXJSSFElyoZ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/utils/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/utils/Build b/test/utils/Build
index e19a1171c..2d97ee306 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -4,7 +4,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
-TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh
+TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh stack_skip_test.sh
 
 define test-util-template
 CMDS += $(1)
-- 
2.47.3

