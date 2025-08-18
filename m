Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D831FDD
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549499; cv=fail; b=poNyZvfYJ/tPmjWF6WmJLFMb2TmVQEE8IqXvtPZyeqZjPyLyDK+ERgJuO1rma41lced65cZuTfHTfGpDq8CW1LyBt/+G5J5I3lMMVANVEEoGBKkdFqgoMnqogfF0kjsO4U9gLJ8/Ry5eUX8bcx3PXtzJVpFL+58XpzxmPorz/ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549499; c=relaxed/simple;
	bh=MT2TiasF27rMW2vINtoNchyWPOooySW0wSvXWlzJ1BI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=J3ithcxYsLT7C4g3LqiCSLOZ2KUocrFDWBeOKKXIh7V60YIyJeX6RtgxiQNA2x3abbDey0hX7kmC8wlYu971IhwQDrXWvqCkV1cY07jQlu63WBoy9eiefx/mZ4HZgy5F/BMEULWskQyB9rfU0n+1J/cWxr7ANb2Zh+Ni3QWULCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i7PYlI+n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GuWBYcRA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i7PYlI+n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GuWBYcRA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgQ3h019402
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:38:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=14QEmiHiaangCXQF9PzSCuqBbJr1K2wXGKzBlsQPq6Y=; b=
	i7PYlI+nsuzX4pf9cVR8ia5DUhp/6UapQrEAPBKQGQ3lCzjqUTrsaFSsrHkEUm0X
	p6oyQ6OW2PEkJoayZkfbatipSyzrBrgyHlFLnKIWvXSnSIgZuwmWEsbEpHTaO8Ux
	Zn6DrymaCdpMnX7leayvoX9RGHXEZRKG/soMjrjjPZ8xwb4mO8MPfNwoNoGcJiob
	Ae7nhHpaX+ZbF0l9h6FLvqKDY6pqYUZTLZ6b9PyN3GjpermE61V4aDDr/lU/IsSS
	p54ukFx4/+gR4OPWS3XaTqsttT7ot+TJA/TGYaEeEy15xrdhkhs7JFjP2Ytkyt3G
	iwedEgz4/J2CbcSkw+YOCw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgdfky1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:38:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IK3h9c030873
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:38:14 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48jge99fej-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 20:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et0l6zBftjDaFYFeuAURXygagXMV8CzZ+uxK3T1FRGqbrdPHqOc9VahK+PSQZ/p1vz/FKXhJaVpvvOZ7kXE3afbFXtrMO0IuZ/T8lXHDO84zpelvYZo1HuBSYGT9ANSlDuz9BsV9cOS/2GLeYXl/w0l/1wYTYatgztmQjMrpgDbw6ep/lQf/rfq+1PV8c+11cJH9WQl3Eka0xIYWmLvKUCqpNAj5ZaCuXOi5rZb5ux9g+iLF6s4JYKz7zHoZi24TAZj9qQHbekdDX+255T/RcPFLGyGoLxLsc5Y4/XJb6hOQ6t43ydbBUdc/Xmzi337nROhi1oJnOG30XhFPGKpm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14QEmiHiaangCXQF9PzSCuqBbJr1K2wXGKzBlsQPq6Y=;
 b=q2/AXSqADphD4mdbYlTux1pq07swgO8wFrE9ibJWC7Ra1f/38AyWlaDFn2T9NV8VlVTeGz3qzmEYRAWqkb3qoVhjscmbuuqwI0Eufj0ADowa2UOSIOqZ9YR5iXFmRaFHPwdfa9HgZlWfD9VjxIPmS77jcbHN2PDQMxTerJkSg5+xgRk969hZYLf2NwgH9s02q56XkkDQ8mHSkZLNcXyVS84QYNxyOHwwP1JjdwRe6E/xS+e1IylNPVuHpzlZBa4uejUYGHnNn3j/iZpeN+o2Ek1vanqbvWYQ70EJ+cvdRZNYsW1e4c/G3rJiapZlalea0/EE18+w6fvW9oTz1hYePg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14QEmiHiaangCXQF9PzSCuqBbJr1K2wXGKzBlsQPq6Y=;
 b=GuWBYcRA1h4J+HkkWyYH+Yty1VMVitW8ZghBdiwuXj0o9rRlNBbVz6GNkMU1sXT/hAGadAgPs0MMVZDJFrvHrCvXVmUTDVJpmDvKfeSo2w0tvAWsx/p+MplJih7+vQSbvkdmd+4gQSCERCppJ1geVZvqFMPX27ymWvr5QRXg/FI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB6793.namprd10.prod.outlook.com (2603:10b6:208:43b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 20:37:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 20:37:46 +0000
Date: Mon, 18 Aug 2025 16:37:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] Refactor the versioning handling system (consolidate
 data)
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672FFF149478BC697F1D2EFC231A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 83de2c4c-a7ac-4530-0643-08ddde97169a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9byTAEEdQ0CPHLZOG6IzjFiBeg6HTXTaFBvr3+4Ef1XpREaKYzwp3GHlJVOW?=
 =?us-ascii?Q?aQI2+T2Vqd6OUwoJ+D883tNq7e6a7ZaCupsQWefcscJaY6/jxSZAO3of7Bf7?=
 =?us-ascii?Q?jlZZna5f9vTmSmpYCHacfDZ/QsrmoS7QqOasuMUuN+2l2TtX873sTv/yFBrZ?=
 =?us-ascii?Q?lUQ7OoUSm3Zwz/NY+T8FjC1t7AgLk2yMUInm56Jdjwi/2YEoZYUekcVWsAob?=
 =?us-ascii?Q?AxHD//Vl8OnhMkK4C5u2SBPq6h2s4s4CgvoDJl/mH2feP1+we7CsmfZIFY8U?=
 =?us-ascii?Q?spTH+0eXDywYGs8jEY/VZAOjHXcs5N33o6MddEFdba59nPztiS+GYNhz0N5s?=
 =?us-ascii?Q?qVHC/4GjExG+CZCiX8PE2wgVFBGeTYfdCjiV3ySiHuc984kswLTpHDH7jvbE?=
 =?us-ascii?Q?dxASh6XB4/xq1C5ZlLOFUH3b6tJOeAgB/y2+x2BABVA187RExaooFNRKTZm+?=
 =?us-ascii?Q?6W5XroPGtQ+BGB7plR/yrdZ9TECA6vwpuoCyrEPF1dwF4aRHbfbBgj9JL9H6?=
 =?us-ascii?Q?wzzkLM8Foh97LPi9UZ8EmNhJ7+t8XTNGhldOFnIJ8GA9CKmEfTZoMW+QlWeU?=
 =?us-ascii?Q?tz73XsFsS/SF9XeykSIikov+VCnbVTz2zNqt6GF80PRlXn3nMo5CkIXkGaEK?=
 =?us-ascii?Q?YTsZA29EWRciJyZL7q0QMwXDIegkHIYvG6D/Au4SiBB/mPZyHlefnGN65Nx7?=
 =?us-ascii?Q?DaUD7TzkYd1bxmN5j+eEv90d4FWiQEuptl5GoHZDSmpEk1ZH/6jVtiHtNR6J?=
 =?us-ascii?Q?De98I133sCdO636BfW6XhfA1TS83DvKn1rpYgvsQky+a1Cmd4O0P1xree2M4?=
 =?us-ascii?Q?l1VJxtPs+D/jK3KtvAxhg+VX3tvwU00cr3TZclwIiHvveq2vQ/aRBRTruESo?=
 =?us-ascii?Q?lYaAB/KLq8fUwqlkyHyaV4LnCx4FEbkN1tCb+gPVtI6dSHJiWsPZ/xItm3IR?=
 =?us-ascii?Q?pV72H07u69L0j1cAIgWnE1dHp1PpLzFvmCpRcXSQsfXxH/O12UOc1Hqh55uV?=
 =?us-ascii?Q?S1yqRVgCDftsKyhWlxxQTAF1qoqDA5hIjvtyZd9wYoHjokbgfyEkh6rX06uz?=
 =?us-ascii?Q?HdvwF3XXn4b0rjatEH5zdtSrlQbq6W1Ei142yoQO5xyGf8YwARVkG+k2TH+Y?=
 =?us-ascii?Q?PZkvzcN7k6LwuOkOQUe9szodJWgXYDY82yMAuYqV2qh9V0m3zjF3uUe+KsBs?=
 =?us-ascii?Q?a79ChtiOSxrDPbhWXNZUiiYWUDOtdT3DRzfI/3cME8dMqFd5IOenmCEfDY/Q?=
 =?us-ascii?Q?2dXw3EpFzvKuGBp66cmQZjrvKsuruLvlpEjq/h/0vaIQ5fkzkFVsBuIv7uZ9?=
 =?us-ascii?Q?sKFGG0VMIbCcHLxRoXeKyv8nZuARfNauqQ13wB9x2zGit4ZG4CLvsiK3oTP5?=
 =?us-ascii?Q?g/wl9Q8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xBOhpNR6peSJnb5i4ToMaE/X6Yu4mLUXCV5pKHOzRLzgx6dgHvSztQhZzOs5?=
 =?us-ascii?Q?1ZBvAMm5Ou/gU0SR/J7F1efkmCf2oZKS6Ia6XFGb7MKtVfDexWrK9iyTnDQV?=
 =?us-ascii?Q?XTN3sXbqptfy9TAMBokU9z4/5lgqiD1SgiFmCwPDUpbbhd5ZjYtR0TpMOfnw?=
 =?us-ascii?Q?YQKBdx8k6Vwja/uQvFwNSs4901uWAHkig7TAfT8MLtwdRkLoFpDmVyce5eVR?=
 =?us-ascii?Q?Efyv0uwzVbi6dt74X7JPW/L22k4U3AOXL9Fr0Y2DhXMLMWXqqKeI5m2eJNNQ?=
 =?us-ascii?Q?+xHxbJO2RoXhU0ofUpm8VMB/mWGgUYVc3m3s2na7OX83vD4U+lYOFKk2QQRE?=
 =?us-ascii?Q?C1ERY4tz/lQ0W1lcA2lP1ejvlt5O4ovPcNbV0am6PZek0PLoPZb05m4He2eH?=
 =?us-ascii?Q?9GppGHZS7QIu5ib8GjB8sDE3u5H0hXqblh8zrATZNTMedeAuBIdTYqz6qeEi?=
 =?us-ascii?Q?/R4b71GLcQMq+ei4X0y3yy/Ztj9p+M0NFbyOTX2LYIUcFkdlsq2PciwGhhAb?=
 =?us-ascii?Q?gcroMfX4UV71syMD7mzWBPHK2wqsd4C/kImceO2Av9upwUG/pyJ0KaM0MEf3?=
 =?us-ascii?Q?OPiy0FAsuypwbwnsHydl7R0pQTpVvVjJGSr88anZqfxEt7LYU5fvKDssJzsC?=
 =?us-ascii?Q?Q/wP6ZMZZiNM0gbqMFHEJWvKqPwzvKmFCmKHJXoJugQUcBqWtr1r5+sRUsYk?=
 =?us-ascii?Q?TdHafqixstZhfP1pL/Fh8KRps7DmV0SKlu4mCczv4HqU2jO/Zx/lLP/lGOGv?=
 =?us-ascii?Q?Q7iIw520SSomPoJmN8bR0PbOqxPLMByHrP23/lo7GCquhQbEsxoDUJK/iuOl?=
 =?us-ascii?Q?Kg7IOdak91hT0BbXn7JiHEkO6X45xENUtqU/nJmSetXIj9sTdgvljEvNK3Yw?=
 =?us-ascii?Q?6F6d6yB7gO6HBeFaffoSSgkmw9woYdW2v73D8YtQYCwLty0cYlDdx+u1xHjX?=
 =?us-ascii?Q?bgCNCeDo8Fu4/jgC3Q7Udq+Xb6RSeTTX+aWBDpRt9ZSmgHjgWOOStn718Slj?=
 =?us-ascii?Q?zv+K9fYt6F6cU3wah1W90+Y0tu/xMqSFrwIHP6UHOW/FUTSSMON2i2/F9yGY?=
 =?us-ascii?Q?GKd8EDf5xS0eTKVIPn770Ct1Bbom3q9IbHn+AtEzpiLY/j9swN/rbbvGmipo?=
 =?us-ascii?Q?UNCP0kGSs7CS1WwOqcarpiExErigtczuMOD0cuVDzGLSaIxFjZ6yiUrRIfYF?=
 =?us-ascii?Q?2n7v0knr9SxSXT5mYiz8ROgnH4g8Ghakwvc6qactEj43hW4zLtTI6ggMEXTW?=
 =?us-ascii?Q?oJElLr9s1gMtMK+nw/D9GBOBpN/4YS5L42wE7Y+YN6bZmWrEp1qLXUjKOc8o?=
 =?us-ascii?Q?9mtFUMArv7CUKeY1Imh3Eshe34vJqGchcRB/E0hBZ5oxbUzOjTaYlORcvxbC?=
 =?us-ascii?Q?+3j3qTVgxUlSYyUTWTphLJT4/22F5H5VgmZOiJjPb89jui9jsoicpcPHZj/m?=
 =?us-ascii?Q?Cd9qQ0jSTxeezt+XrIWkTSiIo7icjBQKco6zGPaSMhFq9WLY+MPN7VEyCaap?=
 =?us-ascii?Q?kMuT0l8KS1AKjlervoq1BHAYRAAgS2sqGQK4wdkOP4AaDIZy5xuGK6yMvoHC?=
 =?us-ascii?Q?+KvD00UCJ+4r8bEap/bm9AfooFEjGHk7TAfFzWvXKUjpUCQPJFPDt95iCgA0?=
 =?us-ascii?Q?xg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XnBQ1Al5D09VqjssVocrFvYsZ0w3vn41OAxVzJIQlm17+Mr5gKcmVSyWW0D9CKVlzocaifZ61+GgqZyrNX7K3mgRNdMDPgkEwfo8HEatvD8t/nLyfv3Aawu24XFWb9RkjPwap8hyW/jczQo1fxA+io1SyLVtDZ1yZPbMS5sIbn27YUADOf11KBuahbPZerH1K9Ty3MU+9vAR5TFjL8BAXShjybL0JqKS7+OiUtbqobdohi+jdS0pg7mK+jx6+MaA2L3NK/7hWC+Jcd1U0CwlLD9FGj4iHi282qgFD9SlmvemaVbKasenZkzmIrYcO3wVEWn9AIWB9LQKGQSMcSH6Oa8oc9vY+acD+smZgIzwHYrsEuTePOb+hqkBsRokELVecY5uYyOLBsSMcHNoUdyfWpBkfLaVGX27Yig0NJugIqKAG3pmVMBjbHFL5mSP3ntzlRAM0zeqNkx1rMe43RxY5/x3lqfxLNVEYZgR3Z4U9vtIKC+aBjthJIVaXqj0tcjD2uWpuPyHSnNG2kGuX5d5HskZVItLAidI3L2hSfXJwSjDzszOVO7mUFFjzNAKntO/N3yLOHyt0x4/uJ4lAa+SrVDdSF4orlxfOTGa+mp/M00=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83de2c4c-a7ac-4530-0643-08ddde97169a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:37:46.3011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vFtSAWKQTdswXWt8oNuKmHIQBPb2DsgSAEO5V8OI8bzkuzKJbT2GM9eqkoBNxt5XbTo9j9OlggpmpyOHc2VqvL60HWgMtq+IplEIbFqOpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6793
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180193
X-Proofpoint-ORIG-GUID: OSoh20MfuRxltFTLeGDNoHMlCTuzigir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE5MyBTYWx0ZWRfXxFVqEM2/emnz
 zYpUzRDVlzVOaQq74d0ykEr1VZKHWZfGkr6Rj7M6i5ZF3JipVp/iWqY7/Q+zWCtRlF9FSIvzPZ0
 l9WsZoCtOuHMbKch5gCDGZros3idqbrcQRwJE8cBYAGCuPGilkc8O6+Rzr2XFAUuMreKoG4bZzr
 JIXP1O8LJ7cBeb32iTIW99y/BtBQPxXgCJ5smNj2ggR9Tb9CxtGp/2zHJ/uBywmuecwyrymq1S9
 w7WCBKL2brrZcpUYgcBdzF/UBdMYz4GWmQZlFEjoV/IHUzu+r7B3524r/tKmSmqnKUIPfrO5tQV
 18NJny88X68Kwx6Jnie6kX6HW8fEOr2Orp/1DpMmZVD9gcZftnbrUA8UX3u0cfBUKbs4xxF314U
 Ro866WjNtuM5BfxMLNXNiYT7NwcXOX+4701XqVqyfW7ZNIvWAAiGQMt8yRkvcD23xPvJEt/T
X-Proofpoint-GUID: OSoh20MfuRxltFTLeGDNoHMlCTuzigir
X-Authority-Analysis: v=2.4 cv=OK4n3TaB c=1 sm=1 tr=0 ts=68a38f37 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=-X85fCDas1XSbrN0yvgA:9 cc=ntf
 awl=host:12069

Rather than having multiple data items that need to be updated whenever
a new version is released, a single entry in versions.list will now be
all that is needed.  The mkvers script generated the necessary defines,
and is also used to return the most recent release version to be used
in GNUmakefile.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile                                  |  2 +-
 libdtrace/.gitignore                         |  1 +
 libdtrace/Build                              |  7 +-
 libdtrace/dt_version.h                       | 83 +-------------------
 libdtrace/mkvers                             | 68 ++++++++++++++++
 libdtrace/versions.list                      | 67 ++++++++++++++++
 test/unittest/dtrace-util/tst.APIVersion.d   | 11 +--
 test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
 test/unittest/dtrace-util/tst.APIVersion.r.p | 12 +++
 test/unittest/options/tst.version.r          |  1 -
 test/unittest/options/tst.version.sh         |  3 +-
 11 files changed, 164 insertions(+), 93 deletions(-)
 create mode 100755 libdtrace/mkvers
 create mode 100644 libdtrace/versions.list
 create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p

diff --git a/GNUmakefile b/GNUmakefile
index 7ad857f88..03687bf3f 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -14,7 +14,7 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.3
+VERSION := $(shell ./libdtrace/mkvers -vrelease=1 libdtrace/versions.list)
 
 # Verify supported hardware.
 
diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
index cf124ba1d..ebf6ac9b2 100644
--- a/libdtrace/.gitignore
+++ b/libdtrace/.gitignore
@@ -3,6 +3,7 @@ dt_errtags.c
 dt_grammar.[ch]
 dt_lex.c
 dt_names.c
+dt_versions_defs.h
 errno.d
 regs.d
 signal.d
diff --git a/libdtrace/Build b/libdtrace/Build
index 164023bbc..a3c3a2e1a 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_work.c \
 			  dt_xlator.c
 
-libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
+libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
+			   $(objdir)/dt_git_version.h
 
 SHLIBS += libdtrace
 
@@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
 $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
 	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
 
+$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
+	$(call describe-target,MKVERS,$@)
+	$(libdtrace-build_DIR)mkvers $< > $@
+
 $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
 	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
 	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 8dd252b08..5c1528266 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -13,83 +13,7 @@ extern "C" {
 #endif
 
 #include <dt_ident.h>
-
-/*
- * Versioning definitions
- *
- * These #defines are used in identifier tables to fill in the version fields
- * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_LATEST must correspond
- * to the latest version value among all versions exported by the D compiler.
- * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
- * it along with any suffixes (e.g. Beta).
- *
- * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
- * explanation of these DTrace features and their values.
- *
- * When adding a new version:
- *  - Add a new DT_VERS_* macro
- *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
- *  - Set DT_VERS_LATEST to the new DT_VERS_*
- *  - Update DT_VERS_STRING to reflect the new version
- *
- * NOTE: Although the DTrace versioning scheme supports the labeling and
- *       introduction of incompatible changes (e.g. dropping an interface in a
- *       major release), the libdtrace code does not currently support this.
- *       All versions are assumed to strictly inherit from one another.  If
- *       we ever need to provide divergent interfaces, this will need work.
- *
- * The version number should be increased for every customer visible release
- * of DTrace.
- *  - The major number should be incremented when a fundamental change has been
- *    made that would affect all consumers, and would reflect sweeping changes
- *    to DTrace or the D language.
- *  - The minor number should be incremented when a change is introduced that
- *    could break scripts that had previously worked; for example, adding a new
- *    built-in variable could break a script which was already using that
- *    identifier.
- *  - The micro number should be changed when introducing functionality changes
- *    or major bug fixes that do not affect backward compatibility -- this is
- *    merely to make capabilities easily determined from the version number.
- *    Minor bugs do not require any modification to the version number.
- */
-#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
-#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
-#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
-#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
-#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
-#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
-#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
-#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
-#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
-#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
-#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
-#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
-#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
-#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
-#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
-#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
-
-#define DTRACE_VERSIONS	{ \
-	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
-	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
-	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
-	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
-	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
-	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
-	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
-	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
-	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
-	DT_VERS_1_6,	/* D API 1.6 */ \
-	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
-	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
-	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
-	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
-	DT_VERS_2_0,	/* D API 2.0 */ \
-}
-
-#define	DT_VERS_LATEST	DT_VERS_2_0_1
-#define	DT_VERS_STRING	"Oracle D 2.0"
+#include "dt_versions_defs.h"
 
 /*
  * Interfaces for parsing and handling DTrace version strings.  Version binding
@@ -112,8 +36,9 @@ extern "C" {
 
 typedef uint32_t dt_version_t;
 
-extern const dt_version_t _dtrace_versions[];
-extern const char *const _dtrace_version;
+extern const dt_version_t	_dtrace_versions[];
+extern const char *const	_dtrace_version;
+extern const dt_version_t	_dtrace_vers_latest;
 
 extern char *dt_version_num2str(dt_version_t, char *, size_t);
 extern int dt_version_str2num(const char *, dt_version_t *);
diff --git a/libdtrace/mkvers b/libdtrace/mkvers
new file mode 100755
index 000000000..c45617773
--- /dev/null
+++ b/libdtrace/mkvers
@@ -0,0 +1,68 @@
+#!/usr/bin/gawk -f
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+/^\s*#/ { next; }
+NF == 0 { next; }
+
+# 1.2.1	D API 1.2.1 Solaris Express 4/06
+{
+	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
+		print "E: Invalid version string: " $1 >"/dev/stderr";
+		exit 1
+	}
+
+	n = split($1, arr, /\./);
+	if (n == 2)
+		arr[3] = 0;
+
+	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
+	versions[code] = arr[1] " " arr[2] " " arr[3];
+	next;
+}
+
+END {
+	n = asorti(versions, idx);
+
+	if (release) {
+		$0 = versions[idx[n]];
+		if ($3 == 0)
+			printf "%s.%s", $1, $2;
+		else
+			printf "%s.%s.%s", $1, $2, $3;
+
+		exit(0);
+	}
+
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
+			       $1, $2, $1, $2;
+		else
+			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
+			       $1, $2, $3, $1, $2, $3;
+	}
+
+	print "\n#define DTRACE_VERSIONS { \\";
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
+		else
+			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
+	}
+	print "}";
+
+	if ($3 == 0) {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
+	} else {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
+	}
+}
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
new file mode 100644
index 000000000..8986d2007
--- /dev/null
+++ b/libdtrace/versions.list
@@ -0,0 +1,67 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# Version definitions
+#
+# These definitions are used to generate dt_versions_defs.h.
+#
+# The generated file contains:
+#  - DT_VERS_* defines that are used in identifier tables to fill in the
+#    version fields associated with each identifier.
+#
+#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
+#    valid DTrace versions
+#
+#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
+#
+#  - DT_VERS_STRING which provides a string representation of the most recent
+#    DTrace version
+#
+# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
+# explanation of these DTrace features and their values.
+#
+# NOTE: Although the DTrace versioning scheme supports the labeling and
+#       introduction of incompatible changes (e.g. dropping an interface in a
+#       major release), the libdtrace code does not currently support this.
+#       All versions are assumed to strictly inherit from one another.  If
+#       we ever need to provide divergent interfaces, this will need work.
+#
+# The version number should be increased for every customer visible release
+# of DTrace.
+#  - The major number should be incremented when a fundamental change has been
+#    made that would affect all consumers, and would reflect sweeping changes
+#    to DTrace or the D language.
+#  - The minor number should be incremented when a change is introduced that
+#    could break scripts that had previously worked; for example, adding a new
+#    built-in variable could break a script which was already using that
+#    identifier.
+#  - The micro number should be changed when introducing functionality changes
+#    or major bug fixes that do not affect backward compatibility -- this is
+#    merely to make capabilities easily determined from the version number.
+#    Minor bugs do not require any modification to the version number.
+#
+
+# Ver	Description
+1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
+1.1	D API 1.1.0 Solaris Express 6/05
+1.2	D API 1.2.0 Solaris 10 Update 1
+1.2.1	D API 1.2.1 Solaris Express 4/06
+1.2.2	D API 1.2.2 Solaris Express 6/06
+1.3	D API 1.3 Solaris Express 10/06
+1.4	D API 1.4 Solaris Express 2/07
+1.4.1	D API 1.4.1 Solaris Express 4/07
+1.5	D API 1.5 Solaris Express 7/07
+1.6	D API 1.6
+1.6.1	D API 1.6.1
+1.6.2	D API 1.6.2
+1.6.3	D API 1.6.3
+1.6.4	D API 1.6.4
+2.0	D API 2.0 Linux (BPF)
+2.0.1	D API 2.0.1 Linux (BPF)
+2.0.2	D API 2.0.2 Linux (BPF)
+2.0.3	D API 2.0.3 Linux (BPF)
diff --git a/test/unittest/dtrace-util/tst.APIVersion.d b/test/unittest/dtrace-util/tst.APIVersion.d
index 85108c027..3b2baaa60 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.d
+++ b/test/unittest/dtrace-util/tst.APIVersion.d
@@ -1,18 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* Assertion:
- * Use the -V option to printout API version.
+/* ASSERTION: Use the -V option to printout API version.
  *
- * SECTION:
- *	dtrace Utility/-V Option
- *
- * NOTES:
- * Use /usr/sbin/dtrace -V on command line.
+ * SECTION: dtrace Utility/-V Option
  */
 
 /* @@runtest-opts: -V */
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
index 6bc7b9d72..0d88b694e 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.r
+++ b/test/unittest/dtrace-util/tst.APIVersion.r
@@ -1 +1 @@
-dtrace: Oracle D 2.0
+dtrace: Oracle D x.y.z
diff --git a/test/unittest/dtrace-util/tst.APIVersion.r.p b/test/unittest/dtrace-util/tst.APIVersion.r.p
new file mode 100755
index 000000000..8da4f22c1
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.APIVersion.r.p
@@ -0,0 +1,12 @@
+#!/usr/bin/gawk -f
+
+# We do not care about the actual version number - we just want to ensure that
+# a version using the correct format is reported.
+/dtrace:/ {
+	sub(/[1-9][0-9]*\.[0-9]+\.[0-9]+/, "x.y.z");
+	sub(/[1-9][0-9]*\.[0-9]+/, "x.y.z");
+}
+
+{
+	print;
+}
diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
index 15010b3db..8b1378917 100644
--- a/test/unittest/options/tst.version.r
+++ b/test/unittest/options/tst.version.r
@@ -1,2 +1 @@
-version is 2.0
 
diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
index ffffcdd8b..37fb6f752 100755
--- a/test/unittest/options/tst.version.sh
+++ b/test/unittest/options/tst.version.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025,Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,6 @@
 dtrace=$1
 
 myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
-echo version is $myversion
 
 $dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
 exit $?
-- 
2.45.2

