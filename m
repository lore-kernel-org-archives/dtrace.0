Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205BA255E27
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754930154; cv=fail; b=au5aA8cjLvhNFQ3aMqdurvbXh+v6e+gRUMDRLJC0v9xwJxNHwTkl4h4gd5VBXCRMuraeIDRVKPNqCAwRv5rn34CQ4ZX9mDTvfkGoF8QGuuokHhcmtschK5zUw3Bx1+rq42r3K4fmkue8lYguvu7U0+9pQdWHTJEDxFgrZNGfx9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754930154; c=relaxed/simple;
	bh=aZctlpmNEB+b2xatsb+LDcsqMmyguM9MKd7ZbmQlv7E=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=OmPJFUe6BK6B9O+YfF7XkjpYqIVtxiS6ke1VA69wASNkoT1t0lz1ht08ryndbeVWAnpiiVgJBfGY9Ws/fLuzMuQpXcDUONqAuue2KUrZyBF8B9iSAUb91XZ2m6VoylcSwZEnqMaQUHsWHB8QAbmSCjiZpkiZjt0fOyADlK0Zxsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=An+xET9j; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YKuafAMn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="An+xET9j";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YKuafAMn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN6j3006357
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=F6bPmB+fiGFOpO49ejfWhhl+0A9FOyK5GSFODo9J8A0=; b=
	An+xET9jLbqEK9Mig1sedR9WS2NytR2/TjbIIH8dntgDX4AsElvTWthaMQCXO2Pq
	ezmLTWXUulX8Yrz/OIHfcHtEmcnbIcmiIUYRqpBXAoA4/t5RdpZnvH2PrIvBQfJ0
	SAYJ/8TbaToA1YJ8CM7CABP70ubVgP4507HZIWMGcv3hUfYNVCCPbl8gOin7zS1s
	ZBAoIKtEHYpdbpM26BomRRgyNzTzIgPzbFI8Mp7j+WuyRmNh65BAAAQGC9XZbP3D
	kF+1C4y6i9QrjwbDt9RiMI25HCV6o/0K0NMivbxAsbDCTHGoP193AcSH8B/HRxb9
	LzDG6BSGpgiPrTO6fFZxNA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8eb0hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:35:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BG3QNG030191
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:35:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs8v28g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 16:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEPkI1KZtvmiyZa8RjNwCMPijfKXv5D3To6XHyn3SWq3j02mbMUpF++TUSoX3OHZywYaVpxo0YYQ0jgsW3K7Pt442fmwAoYDS9yATGI27GdIcaMgbEYF5SEZvqmPNWAiSWezXGnKZSeCS/w+ujNjwT8o3J68p+bSgYQkrE8//y+1POfOo+wptOIjiXGfUWAdIw5yZ1zssyhahj0cIlcg16svRmXYNa1CCNqVZRmOtAW1DUD1BSS+4tTwf0Lfct3KD+RzmXvbA1O12aA+hzZqyLFUDsoX4VAbi3nEt01P/09AgvA6xb5JJDSuVlqtFTAeayQmJyixcQdiOt7QZ6L28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6bPmB+fiGFOpO49ejfWhhl+0A9FOyK5GSFODo9J8A0=;
 b=d5Rbu9JeP2+urpfg3KsbOVXF7gOtYQpmJvbbLVjb+C0w9Kg6FbTbCfXIXGUT8zHvFUjcuKU3TKbUXUTV+Up9826xQAHbb4PULfaKb2apkQ7S/+cBmCDVulousg94pRAeO7536uMA/Ny57mMkRIQiOJeeRCr3KOmB/3L9DV1EPgeW1Htp1Libg3+ZM6zZ2qdBkx/IzAgvMc00Dww4T7WcHu4EeTTIdYZG1fQUbbBq1kFa3M3JbjkAD6xsNWFp2HII5/E2FthK5H1hI51sxIsVQz76/QDnpX2LwlXhQnXlQrIMgnxIaIbn+oU3GZukvGY/ROeFXAaM67PLalM6BDtJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6bPmB+fiGFOpO49ejfWhhl+0A9FOyK5GSFODo9J8A0=;
 b=YKuafAMnMa/4Tn7pFYsGsKRnZT9xEiTDVcP91Mh2yLMkjqs1vWUMQ7+dq3jsUYgvC2fdzJLwgXhTpgBi5jGG+tiyn3iXZPD0apxAwfWZQDUL6njK6pzbSqTiBcsOzh4A23IrAJholVh7mlG92LO+OQ2AQDQa2LzKV2WZiOQEiJM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB7231.namprd10.prod.outlook.com (2603:10b6:208:409::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 16:35:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 16:35:47 +0000
Date: Mon, 11 Aug 2025 12:35:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Snapshot aggregations just in time
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672BE5DCC67590D4CF36B15C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: df65d595-c4d6-40e3-51e9-08ddd8f51fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7MLgL5H+FtPHvPvJBbofogE+2MHK2V3OOuQOjWLGPeb2kDLukYXyhMdf7/vs?=
 =?us-ascii?Q?dtD8x9f0lAgYzKXELYFo+zFLxFScpChc8fV2E2ENPzmrqL5+jhY1OYZaYTxr?=
 =?us-ascii?Q?boQLDZriihNBPVryUhCDce3orJebnzQMoT3HotS4py7bfF31w6vwtc41lNMu?=
 =?us-ascii?Q?ztwIJEJKLW8pQI+iDi0BwrF1lyfoJCr2S302oXXBJjmgufndcqOA8i9j5YPG?=
 =?us-ascii?Q?Qta1CTOGofpAf5kp0EOmnd/3iuTxL6Gw+W9MUGCKmV4RMw1pAhTucYat4Txi?=
 =?us-ascii?Q?8PuJdnhE1CwzVUXTBU0MCP1685oa+IHfDzW81ttVT5Y1G0NrOaq9XUPQFRi7?=
 =?us-ascii?Q?NGLFlMzEv3b7+VcNlPS4HtauV7phgIXn5wRrzS8f0Pp/knxHnlavlrRZiRhk?=
 =?us-ascii?Q?rLzQuE0IC7CrW2aVeQ3XhXA0f85HkmrSMaXMVCXNsXAM+O/YpGCDF/eTfkLe?=
 =?us-ascii?Q?VgOxnv1m+BFe8iitYCTFIvKG8lDA5MWTMmPWWCfnqlv/vPDBZI3pO5rxAQkw?=
 =?us-ascii?Q?0ymf9jpmeThVp8pRvjHrvNUpypTkBFdSJbV3mpWRuqUykYdaGruaj8KwVpCQ?=
 =?us-ascii?Q?FHLWtzUOAcTLQZ47Eigd7GvBxYdH03LHl83zbJOQ73W5LzbOsUwOcNWo1dBD?=
 =?us-ascii?Q?NtE2cy2JK9jYm/mQw3RCOhS2+9EzbMgeaFtpdgZ7raVlthQgpVY85hVxnggh?=
 =?us-ascii?Q?bLUZTX15p8IXl8cnmw2Su20DgfrWO2euvrVtlkzu3yON5BRxloCHGLlHtdbP?=
 =?us-ascii?Q?ZBc+QEhYqhpNTERQHoKm8wuMLJQwrBs9cDeQJfXrjf46bZwDLwA4rSNNGNwf?=
 =?us-ascii?Q?VZQo37otz7Syll+n1uFgH1uSFG5Wps/yV8lDx3hN4fWvmEKcaLtIkTj1rdnY?=
 =?us-ascii?Q?9I5LpeUjYSSncak3a79UkdQ7EU3ftTVPt7KLU6kCt6asYV1Z+nGQOlKqxnpJ?=
 =?us-ascii?Q?armKmHI5XqHLDY9jjgz4JJ8RGnUhLQjngXAGYh+OAB5g0351gGPojJ+kSXKS?=
 =?us-ascii?Q?v3+hZOaZKGv01raelaUrjS5H5ZABU+S7COS8lB1KeG4r9uk09uKicfpnilRI?=
 =?us-ascii?Q?VPsGWc+LzGysxST2blpFBwyEusv0IRd7EJwgg1Iok6LqBmYMnM4NPMMk3ZHq?=
 =?us-ascii?Q?SeRz139mZuAQgcKjvFJRWMC+v8B7rh6CXfmFseWhd/eqbFrHUuZFHkfwUKvJ?=
 =?us-ascii?Q?LeroIvN1cFCwX9ofmPVlY2FeabdOgvHcMDqBXiWOlystAcSMPTaiyl27zCN6?=
 =?us-ascii?Q?4/tMXCoau8GLkp6sr32HT2XnMaXgUiY16M1bRxPDN/s5e7v2YCNKZgE53SWb?=
 =?us-ascii?Q?Oh3yTozUvoLDujKCztisamLYweaagbTr4zlxumCVVkSKSfEpcikipifrqg31?=
 =?us-ascii?Q?baKBCIRXu5T3d9RfiGOyYDYF48i9hHtD9SAQIK7TP0q9g4Hmuyj6izqVUESW?=
 =?us-ascii?Q?xVIdKYY79o4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bNZJSckbVtaguSUxYHW8A/DC+qAMap+gcmI74AeBqZH5lA3BaTaC3+qNa+u4?=
 =?us-ascii?Q?2RdZGx2jSrQe13U58mWWNuzRjxZmeB7npASpTPy4+BjlKiEP7Kn9mFduMOdK?=
 =?us-ascii?Q?7x+Chm3YbY0x4CmbNHGk5fwdw1RhaHFDhto0vIiaFdZvrZogPKtklNwexmYg?=
 =?us-ascii?Q?Eb+SySwTii6ComMqbNuSMh+NlChWHlZDyUKBEsTJrO2oYAfNG0SxoFOrAusd?=
 =?us-ascii?Q?XSqtzzxiGcJQtO6rvtMSlPxyQ/MIU0kK1NH+ar/yvp+KybzdJQFqnVvNnqzE?=
 =?us-ascii?Q?wF7k2Nstam1XnRd2P03TRzmYB1CntPmeQuE3V0gFGOR3+EgKfrmhzltsJ39J?=
 =?us-ascii?Q?5BRIGO1wW3mj9UJYB04ifrVQLyWTUYv1iNmCpPIOdGgluee6C96E6RlJe0cD?=
 =?us-ascii?Q?WcBUjkB9xBxJ8uwClwqf739U5TdjU4zBiQt276t4bdh9ERmORHuKL4eH2fWh?=
 =?us-ascii?Q?R+TzgadzyejBecF08EMAzbuv0wKpknNCEyGePnm3Xd/BzDgx6Q2wBszBCdhW?=
 =?us-ascii?Q?8bTXrb0Z7vdzk5b70JSWU6X74fHTuAhhTgLaPOvqYl6Wo5iDAW8EoLT+LXZ+?=
 =?us-ascii?Q?8/JM8vIBlAd2gD9OHxK15awOSDfuzRIOvgub19FtJVGIt7hM0CIHmJ9H2JJW?=
 =?us-ascii?Q?s/0+26Wxgp29cf4SrLtGephum3z1gIxV/Va83/VhlP2G1emL1DH9duqmlV/E?=
 =?us-ascii?Q?MkOtNqR5+Pgw/u5JYW2X7wZxwye/fZhLkpUXe0qmwxU6sScE8oT/jvKF/pac?=
 =?us-ascii?Q?09cmaAMjB0g2vw2jeYMeb+xAkWwyEgcZWuGL2EupJ3/hMpZdW4Fo9hEQIoRP?=
 =?us-ascii?Q?udD/fL4qJD07Er76zcMj8oxZSyCDFQ9bd67MJObFbwaGmYbRGCLQaYAp7m3m?=
 =?us-ascii?Q?uTIcu8mvr4M37PdV0ysvTOa6mwzyU5NM0kk/+ZaxbK1rSIoyHlzBSkTdm3dQ?=
 =?us-ascii?Q?a4580ONRvOcmvAGiZEAJxjZbXF3ZgRHPD+aRp4j2i23dADQAPcvvC2TnnHnH?=
 =?us-ascii?Q?VECcMe9QFQ6CAEILOxAFMukvyKzFMzjXK98JoWqcjdSygIlJKYBzGxq4g7EC?=
 =?us-ascii?Q?K2ywA/zw9SLu+fRu4mq2T+uNcS3dNPjXarciDE7WLmb2m7TWCANi7NB5KzzW?=
 =?us-ascii?Q?4nCtr/wuEqCbaH7MyC+nC2Rxrm+3V84lpnMuwrVJCQ++uSLsqd4LpYWbzxSN?=
 =?us-ascii?Q?BCWz8Sf1QDKj1om/3EGh0u4b5MT4YVafyQyITO5/qqQLesoSTYGrZRnBhwNu?=
 =?us-ascii?Q?pTlq4+h9ds87ppmHanLv8XdAJmHGJ3Y4lC8ePFURoSzcfaerTo66D4kWljrF?=
 =?us-ascii?Q?RzmZWhXuUsBlmDhJ+a1VbjmhDrLJrwzt+ZDReRrQtZ3iBVTcCZaqNGK9njHz?=
 =?us-ascii?Q?BuUYAJrbxfPtA4VjzOtT9u8yz8dHmp0W9oNa0KbN7CFzbwQZrUvsD4HxyhRb?=
 =?us-ascii?Q?P2+bMDM63rTQAX9zB0ca7qlLJw4M+GuH0ZHO/A3yayMf/zPDucWqJ47iPCw7?=
 =?us-ascii?Q?Dgf5Nh8sMYetdMCPBmyu08xvgZJzT/IT9v685teRcDkgF9NWmWAzQ7jVcCDT?=
 =?us-ascii?Q?Z7MojC9sc7SPE6rWQaJrEUigOJN9/Kka6oj4Ei6Z9HqcPxJGsd1lhH844sJw?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ra1/Vfm3RZ5DEQTe04ZTBm15lSp4TK7HDz711sZ1gft+2lHhoXzO4Xhyniwo7EScpDI4iT7IJNXKwF/8mPdgVsL5acOxJdfp2tT4twZtU5CGH8Jemmi+AB3euNgvHlV55ugSpZsw5SfoPY9jg0D6AK4QmVBzmdGhG6HKiZYZ/7ol71sIkvnezKI4V21/lwi3qJIykubrDjf3l5jK1qi08obArAEy4BZnP2LUeR1cxNV8gbH6MU8CHQYZyK2YA9o1CTn6nLrhLF3mWQPY05aguS2oR2KnznFNLV7SiD/H1zwwaEjoAAAnRsUFZ1BdW+7y0nl7HjWRIZd6zN3okG6IMFATTQyldL05/eth2Vl6WNOVC9MIgbqao4St/9YqqNAKeF+2xKNGffzcqFSirfyGlYW1XG4TeTSM7Gph+BUlz0umgBftp8DbNNnT5m4Y1gcJ2Nuq8xly5WlgIUvpc6ds//WRdY6LPqPOHDItooKtajpm5Nxv9uY+CdHqzNRaXo5Fsm/wh1fZbCXVoH9+7JxvFsN6iPzOKbU4g3Ggnu8qgEg7qySPdV0Zf437mNYKbI2H77gnHdJiu03DrxMD0XecpdRXcXJZucLXVmw04vUT6iE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df65d595-c4d6-40e3-51e9-08ddd8f51fe8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 16:35:47.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yqsv1qLeZP+PjPaKQ8VqWS5+gDFRpIclD8TImo9VsVJkLu5BNIp68QUikXu7zHWV+iq6RarHRj0jm6Yapvsah23na6kq4xLxm64TOqpEjHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7231
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110107
X-Proofpoint-GUID: cMw7Lk0s8sPBauqKBhxvipSzTBtPr90d
X-Proofpoint-ORIG-GUID: cMw7Lk0s8sPBauqKBhxvipSzTBtPr90d
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689a1be8 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pfpx3IlOxTofehG-Kq0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4LpWAqWu3sX6
 FlWI+cGVFMQTVQ8sOsT9FVI83ZPDADhzqVDi5ZguzrgOid2XTHWJzmde4e20jb6lB1R1TdNTPm/
 DPtPGHDYZC/16H5BxQZGOST0kCfACJUV017pTzfI5TT6OC9+okqRy1UPy4b14QMKV8PXk+sFJRw
 jPlY8oGZO1EvlorrHtm7Ih31nSdQ63eTPg7huT+ewP5wfjfUiG/hcu93MddZQX0nrRVRxAF+Xrs
 m7bMA7/fi/g8Z4jQ5nYmMfYS/fO4ek0iZZq4HjzA0zH2tQLu/nVjzbt94kAuWTKr5ZVnGS8ZV4D
 8Jx0B8Y29LZp+7zLYOBJxY88beEF6RQ7H5zgOen/QR0SeQZDWNpAEXgYrnI63iGF1zDi7QNh59Z
 L0WCO8FHDl+iZs+RM7OqTGD/eh3gWjXfU7FqGK1f4+MGSUg/hojyKkhWjHNrxA85nL8eKVz8

Author: Eugene Loh <eugene.loh@oracle.com>

Currently, dtrace periodically calls dtrace_work(), which in turn calls
dtrace_consume(), which among other things calls dtrace_aggregate_snap().
But aggregations are kept in entirety in the kernel's BPF maps.  There
is no need to snapshot the aggregations into user space unless we're
actually going to do something with aggregations.

Snapshot aggregations just in time -- that is, if there is a clear(),
trunc(), or printa() or if aggregations are to be printed at the end
of a dtrace session.

Skip the aggrate-slow test.  Just-in-time snapshots mean the semantics
of aggrate have changed.  A fast aggrate means nothing.  A slow aggrate
means we are supposed to use stale aggregation data, which would be
baffling.  A future patch is advised to deprecate aggrate entirely.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
Changes since v1:
	- Changed from using dt_haveagg to using dtat_flags in dt_aggregate
---
 libdtrace/dt_aggregate.c                 | 13 +++++++++++++
 libdtrace/dt_aggregate.h                 |  1 +
 libdtrace/dt_consume.c                   |  9 +++++++--
 libdtrace/dtrace.h                       |  1 +
 test/unittest/options/tst.aggrate-slow.d |  1 +
 5 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index f9e364435..1fc8294de 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -73,6 +73,12 @@ dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
 	dtp->dt_aggregate->dtat_flags |= opt;
 }
 
+void
+dt_aggregate_clear_option(dtrace_hdl_t *dtp, uintptr_t opt)
+{
+	dtp->dt_aggregate->dtat_flags &= ~opt;
+}
+
 static int
 dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
 {
@@ -764,6 +770,10 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
 			dtp->dt_lastagg = now;
 	}
 
+	if (agp->dtat_flags & DTRACE_A_VALID)
+		return DTRACE_WORKSTATUS_OKAY;
+	agp->dtat_flags |= DTRACE_A_VALID;
+
 	dtrace_aggregate_clear(dtp);
 
 	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
@@ -1848,6 +1858,9 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 {
 	dtrace_print_aggdata_t pd;
 
+	dtp->dt_aggregate->dtat_flags &= ~DTRACE_A_VALID;
+	dtrace_aggregate_snap(dtp);
+
 	if (dtp->dt_maxaggdsize == 0)
 		return 0;
 
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
index 0dc126e9e..af2b7f9cc 100644
--- a/libdtrace/dt_aggregate.h
+++ b/libdtrace/dt_aggregate.h
@@ -46,6 +46,7 @@ typedef enum dt_aggfid {
 
 extern int dt_aggregate_init(dtrace_hdl_t *);
 extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
+extern void dt_aggregate_clear_option(dtrace_hdl_t *, uintptr_t);
 extern int dt_aggregate_go(dtrace_hdl_t *);
 extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
 extern void dt_aggregate_destroy(dtrace_hdl_t *);
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index b0bf73d10..edfe5bbae 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2352,11 +2352,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 				i++;
 				continue;
 			case DT_ACT_CLEAR:
+				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+					return DTRACE_WORKSTATUS_ERROR;
 				if (dt_clear(dtp, data, rec) != 0)
 					return DTRACE_WORKSTATUS_ERROR;
 
 				continue;
 			case DT_ACT_TRUNC:
+				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+					return DTRACE_WORKSTATUS_ERROR;
 				if (i == epd->dtdd_nrecs - 1)
 					return dt_set_errno(dtp, EDT_BADTRUNC);
 
@@ -2518,6 +2522,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			func = dtrace_fprintf;
 			break;
 		case DTRACEACT_PRINTA:
+			if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+				return DTRACE_WORKSTATUS_ERROR;
 			if (rec->dtrd_format != NULL)
 				func = dtrace_fprinta;
 			else
@@ -3095,8 +3101,7 @@ dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
 		}
 	}
 
-	if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
-		return DTRACE_WORKSTATUS_ERROR;
+	dt_aggregate_clear_option(dtp, DTRACE_A_VALID);
 
 	/*
 	 * If dtp->dt_beganon is not -1, we did not process the BEGIN probe
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index c85f3d810..ef8f730ab 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -365,6 +365,7 @@ extern int dtrace_handle_setopt(dtrace_hdl_t *dtp,
 #define	DTRACE_A_PERCPU		0x0001
 #define	DTRACE_A_KEEPDELTA	0x0002
 #define	DTRACE_A_ANONYMOUS	0x0004
+#define	DTRACE_A_VALID		0x0008
 
 #define	DTRACE_AGGWALK_ERROR		-1	/* error while processing */
 #define	DTRACE_AGGWALK_NEXT		0	/* proceed to next element */
diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
index e2a0f2cb2..cd91c0a6c 100644
--- a/test/unittest/options/tst.aggrate-slow.d
+++ b/test/unittest/options/tst.aggrate-slow.d
@@ -9,6 +9,7 @@
  * When the aggrate is slower than the switchrate and the pace of printa()
  * actions, multiple printa() should all reflect the same stale count.
  */
+/* @@skip: aggrate makes no sense */
 /* @@trigger: periodic_output */
 /* @@nosort */
 
-- 
2.45.2

