Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897E0245008
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340537; cv=fail; b=YUEEAlwhz2X4gd42oweg1krDM8XKKayjrsMX463SjuYo/KiEKXOC/PpU11oVa90xMbHqWxnmnZWb0FPg+tBWt3l+KGTJn2ppWS6gn4DwLgqhrY6jQ3orb65jDXJmfXJUGipe9vOEnG2+HqAP4r8zwqnLLmmfoHAXEWFtL/UVrIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340537; c=relaxed/simple;
	bh=dhKuXMy1rgLCirM/pY8dNt2ZO6lH0JboTQjsCKmgDMQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZxpHdhdk120pSR5eNlQaM+W/x4wgBKVU+V6pC9eRNIWaToh+czdFUJnAhoBTGRZyk8delbPO2NphQr3Ho6fcVx1Ix8XZ4WKyTfZvrQfmT98WuFye2AfNc4PyF4rYEW3gRsFaymV38Yew9jZlRTNV+K1+TfR+hVQ7jL5vNiTiAyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S1qAVGV7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C6HM8BT6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S1qAVGV7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C6HM8BT6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DGJlSp2735415
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=w/MmfMI6Ulob5EXfeB
	ih47jkqZjTc+eLJYI3Tb5g26g=; b=S1qAVGV74Jyk4pmg8ZGm8roFfDfmu9ZsGe
	kBXLRv0/M0LOvyQmhJWC7/pb/jukxhYm5vvL1OHNK4tKzIeq5+pfSb4tt8V4Rwii
	PeXklWxvjsxzAk4Hmt6WY7HaYAyMBVblCsXpB+m7JX2G5pEPNkxIEdBZHQegOs2p
	uXDiWXQlq/+dZ7Bf5ZwQa4WTc1xWs7t7TzrsawUolqPNVIIMIbPEuV3Z869H6dT1
	FcUI+rAkL8AkNsuXUGr/tJmTJQEJm4uvvCb+BL/VdVxGU3zaviG2G25eJ3sttYrw
	F+dJdHrFFSJ1U21lV2krA6Ie4mh80xWmruex8XUkJwGYWph6uW1w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrr8c6js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60DKriHo035374
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:13 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012054.outbound.protection.outlook.com [52.101.53.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd799kuf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 13 Jan 2026 21:42:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tAAkBiXyQeo/3yzCJyEOTP242uXuwNuo5XaAgC5FRAkEacOjBphAARGtb+lJi1BKyzzdBvtX+M/BSNw5E1KXIb30mhwbboA2YU7BdVHtx3yJ2widhyXtHX1TUJV6hCHYCeAoihnmGmi+4UBPBEaGXZRVgZk99hf9q9qjcbFnN0ozNpl1edr01UImcmtDFOM+1irif6PWNHxmFYPoPYIpqWdQ8obpIWnGPBhNG6/86Uycjppr6cSTZUuQltjdi8YWhaKQiFpk9rdv0UEVbKM3vCs/HSyfkARd7URUX7rGM/I9Rp+ELCxGDfu6XeHMTTUWjQLbgFEo92jHsn/Ur9xeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/MmfMI6Ulob5EXfeBih47jkqZjTc+eLJYI3Tb5g26g=;
 b=pJuDH8RKz8Y/YgfGHyqVE8CqkEuD7mEVyBiVxN+uCO0a1tqBivc9/CbQIJPg/U3R9fpofu+JErmfXbKSxwE5RNQnTZwTnc/iiRnnB5RQQcNQogsOr9LL8vWtvJsdG3Z0IZd8JVh3oeIESkIMZ9wxBnUlI8w3TU9zKaxi9AxbZM+EYE6k1A/f7ueNNSoQ1tgMZtYBCBOriz+uPGYohRzdd24hPj4dmSzotvcXE1U6B3e0HjOcez2xiXW3BrjbBgRnxKMLljji32dx9/44MId/ELJvnL5sZoVZwPaHmA5Mdi/nS0d3BNWsFMmcvA00nNODJbXY4aXF88P1AWTId8Y3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/MmfMI6Ulob5EXfeBih47jkqZjTc+eLJYI3Tb5g26g=;
 b=C6HM8BT6rL/1SU7EXAHdWdzv8pGdSa4mqoo+lGZH1cuRVDEAV8nh0NyDT+nvSWM/xm/8Kgex0Ly/VEArr7Rqm1Bt1XH7i7cF883crFtSFpQfZqbUbm0QbLASVttGgQrS3Jm+Y6haoZys2smjgISt9j/eJwvth+LmY4ZGEnTk9OU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY5PR10MB5914.namprd10.prod.outlook.com (2603:10b6:930:2e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 21:42:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 21:42:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] rawfbt: prvname is not properly set
Date: Tue, 13 Jan 2026 16:42:05 -0500
Message-Id: <20260113214205.9159-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260113214205.9159-1-eugene.loh@oracle.com>
References: <20260113214205.9159-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY5PR10MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 31ca3bc2-2b6f-43fc-1110-08de52ec9b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zSsjFlyMQxhFdLzJ8hJ/16imlxJmM18l0c4AClbubfruRLZ9yOSMyz5RPtNz?=
 =?us-ascii?Q?ySZ5/8lOB43TaGjYyLH7jPn7T5UiBJiYM6a3Lz37XUMIOzx5V3rZRNdb/s/S?=
 =?us-ascii?Q?VXcqQdqsRv+OxDbNsxZXlr4Uv0Sv+uy7barMpWwboPptUVWAnOiixlxCIZtD?=
 =?us-ascii?Q?Bv/AOakulpOOO4zqArGtT5RQZCD7bkPpniiyCXjKZWpvFqd62V+f7OIysPdq?=
 =?us-ascii?Q?GfBqIRDnFGUVtFseaBi6PMpSxrrnOx2bYw8lfd7LyzUON5By2xRSUDHcJBJ/?=
 =?us-ascii?Q?mSud1hbH/XLga+zDKZg3WP+fIrpSeb2dTI3G3hFxSleFAKgtVgZvZJXKkaj0?=
 =?us-ascii?Q?ix7kvADCjMXm+pg8raNH542bBWoZS9I7XdhVaqYg1pHleSsl4CxoQ5L4M6Nb?=
 =?us-ascii?Q?q4wV5oc42CH1mmthRetXaH/4OJddE6goCvRC7Rk/r/diIDywhRsu0K7t3otR?=
 =?us-ascii?Q?ZR5z8jcl+idwaPcA1D4CPri+YCjv+xqFLORyp65viNhLTlKP8jVLoR2mjuOC?=
 =?us-ascii?Q?gst2XWvcnCLirlhSd8BJEIt6GyLQL74uWy4vKUKtZSeQV9cNTlb047Zc2095?=
 =?us-ascii?Q?ezpv0HRH/GWpLK8GW+/6cuoKSXjBm4MOa/+VjvElz9iVQEulhDhpwsBa4wAv?=
 =?us-ascii?Q?AFu3iAZ42Y82AD/R3FJ85j3BGBH7v5Hlb6CAqqpkzQhdJ4LEWx/0ZBF9iDB3?=
 =?us-ascii?Q?uMCJUO+rANcbdQ/r7t+OlQC8fGpifpZFWRAMsoQoTZDNCteJXokp4XWu5/nD?=
 =?us-ascii?Q?B0ZYJINw0/tIl+yvU/XnUJRgb3hVkcTc4I5CiOY3kgaaVlUivqaczA0OkN62?=
 =?us-ascii?Q?FdFc2cyl8G9qC5m36LS+5tlG9Dq4VqYe0BPCnr8DUHiLF198m80yGumJMp8y?=
 =?us-ascii?Q?OutUWk7H11WdZqCSj9LomPlfBdAOKZE/s4iMQ93fu8cxYbwMn/Hcq3BGQQWa?=
 =?us-ascii?Q?T5kKhXPKVDhgR8D+SdVS3VfVys57nKov08DgF0wMzifh+877zr6NaxmQqbQo?=
 =?us-ascii?Q?nFfEkTI/wJ9OwNiCQZ9sdEse1HtzNFiaN7wTB0V1d6yg5dKPH2DwzHygifp6?=
 =?us-ascii?Q?O5vDm5mj3yUGgWIEGKU9WnAatBpV+929722tzHv9APpyfGXrfzwQwiAFI8U6?=
 =?us-ascii?Q?u4AJ7pCQKenRusc5APOdJxl03ZkD/hW/2JMqDdU+KCGpsqe5Lvj1iIayS+X+?=
 =?us-ascii?Q?pjO0d+noxr09MjrJIkVRVIEaM8HQOvs4zJSGMXQLkJiJ3UJ8JD7VgJd1VE4l?=
 =?us-ascii?Q?fk4aOwF/M7mg2dI5Py+RzFExRtLQ6tUgit7zebVv3Pm+5wb0QZrCpaQ2xWAo?=
 =?us-ascii?Q?JbPfiLKKC1mt9/CreVVAgV+lO41zt/k/UZVNRvXj8iuUQx1f9kmm51II32HC?=
 =?us-ascii?Q?GbDrYqH6ofQsW/VOeaatAPOsnMeO6XwYbf60TVTLE7mhd91mSzw9ttHHdLxt?=
 =?us-ascii?Q?HRy08dYP8P3QErQgMbNLZYX9ml6g9C6wCmCWDMAjPXKTr3xVteLaAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GpdIKNTj72xPJgWIlfX/wXcPqFPJkfkuCo2RhvrM+1RyYt1AWduCT91KqqxR?=
 =?us-ascii?Q?OrumJ8TAc5+9OMHgyG9Lnz+BZTsTNJEmSGmgO4BgaFvB5ZRlOQLRDTB6HDcy?=
 =?us-ascii?Q?0RgJWoPSTI2FebGfl89snRqBvZ4Bb2OeCfDl27O2jWrHJ14uR+JGVHwNyH+S?=
 =?us-ascii?Q?oBhEdMVRdRhrKATtz9Ahr29gvujEW2kqjZPcdMyOf/nWFoe17e60PyhLMqbJ?=
 =?us-ascii?Q?cIXiKREAWNb1mB3c2d03R4X31szNVpnl1vHeIbUAt99HR8kmj+J3LOzU9CZS?=
 =?us-ascii?Q?tAAZRo/elIH1rwGkuZy1ZnzSZbeRDGX6Eq8N95xqZANqL2fTkpsw8nDAqGr7?=
 =?us-ascii?Q?r0gCycEDjSEaLDhrRk3fOLwg463WCt0G2HUtfp75TKqIkrA4EUgdnPIwAMRd?=
 =?us-ascii?Q?E2uw3VmiPm+jW0imZvYfjKCQM27mAwYKC2YkSe48uL0PVxR4JuUY5/pQhQ3X?=
 =?us-ascii?Q?TBiB+BMUAcEJht1WR9Dua23yX0gFfsbP8ba67hbLyZYkLMOnQR6YW646YleU?=
 =?us-ascii?Q?oH+bJ+pJXBWUtwVhlPkhq/Rmo9IWHrOrM6DNeYTrK6edO1BXQD4GGXOhZmkq?=
 =?us-ascii?Q?1JPSW/n5Dkkh4QS2iEf+Ur6+Zd7hbNeBmX/ay/6kWEW9DZ+kxk4WI/37kaua?=
 =?us-ascii?Q?W/k2S39v6IfX1AjBvKBda0fMC6UU/Ilm0U3GO3bIBpvh28wPHK8dyLo0Bn/U?=
 =?us-ascii?Q?B/mTmNv7f+pLWxlx9PdvKvstLnPMvfsTz2erqSC6OXZ1udJU+jAe8l/Vjl/R?=
 =?us-ascii?Q?2mp6KQO8NjWdR0UvX+vQoyBM/nSXnGKxoB4Po58ONRCDnLqgC2y1pE1x3KbU?=
 =?us-ascii?Q?CewyVmoMBVKYoG9nR/W/DJrO3W2A7Cofjifpv1nfAH+UpTil41aPsOYews62?=
 =?us-ascii?Q?OKMTfEFZTtbqEXjBg2rSJ69BpgLcRKcXp+2tmDBuzIw3zm0K8k56wFNaCEGp?=
 =?us-ascii?Q?/EJI+E+pKVOsHUBSAsdw0iklFjRFZfKiV2UpAL1Xd0WSE8NVpkNFrI9Xn7qz?=
 =?us-ascii?Q?JPMg+0ivzTB9qS2l+PbWqyj5nZkPm83JtKMfwffvH2G1lJtfegzTBxAnOA52?=
 =?us-ascii?Q?mJLuJBLOjKij2gprz/cQioDAEaw8UeYxNG+xbaVHPRuVBP1Zxg6ElVbNy7NN?=
 =?us-ascii?Q?YsuPG61v5niHs0AgKN2se3SvKlwE2zIOwIgYTrrUDBvfoglL9pntMIZwOnWG?=
 =?us-ascii?Q?mYSX4ct9Bv6nAqDt0Xj1JTMmdFWeHK3x+6ByicaH8wqTQeoh1gYURBp5IWeB?=
 =?us-ascii?Q?AatiCnz73LyAfmGWzAUxHZM4rorfGmp8hD10nth7/7ggPhrSqeKS+jABZlrW?=
 =?us-ascii?Q?g4SiYpIXdD/mEMPhLvMVjKeL57whiVx17eK5ijjj95S1F6d/POfu0kftYZL7?=
 =?us-ascii?Q?oKj8vWoRXjqSErv8Hm3iRTSVwsu/9DRzG6o4139NHWj0WSbCGa67f4nUQSrB?=
 =?us-ascii?Q?bw0wbyv1tKtf5n5C3vgiQbgddALm5IoxSLEj98ApB6IgBfP94J3y5xyGNgfl?=
 =?us-ascii?Q?sA3A6pTLGf+zcWIM9b+irdCrN2p8gkV/ightXisos6nJo1peCLBnGBMPyUk3?=
 =?us-ascii?Q?NxNCfIkSmYUjHNRmPsKMcRz/W3D+3RkkK9+XHailoDu9pvUEWm6DxiKmh5xX?=
 =?us-ascii?Q?75R+3ZFJYc3nAVjLF7JRCmaTFUdBAYdLx0qBG38zZwMcZMppewfMMzrCN9/N?=
 =?us-ascii?Q?AT+geeeej8vePRMopbvV0Noepk6xsPdKj6lpTKxJp3amQtKe8UxJSwFjhF+7?=
 =?us-ascii?Q?P9l6AwC8PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c4Ve+ZpovoxEafAHAi+ZOOggIkThME48uyCEC5WD2V/sd59anOq2PMlng8hqzOt9LxmkJtj7nT0vDowLz+jh4R7BDAeztHAp0B1aKli7EYbIvHbeZUe1a3arfTm3QhoPHMYczYPISENaG7VTYg3RXRmuJTjCsmhLHODHN1EGWnW5bsW0NEbk3A4Xo5T0+w3GDEeYHuuLnGFG6UJcFjXPMSs+GKWjMU6HtIiaG5JG8gwN+n2+fQhDVdkpM8bCLizkQniLj8hp57f77n9Kwp1PyOlgvLA/1ZB8kw5z6u/KCFtlzvBEFAp2DBLbvcRnrGn6D1t0PQOlvfv3e8cg/6Kb1qx6elk1eSkrXwWiVw4HMeBK3zuNgQ6GclzYnMLVB33zrF4IkHYW4gqMZF7TmyfQapzBFxxNGycXRIp2TR0KDlA1RJaUZH+S9xkUeSsaTZ4aNMWAmr92oLSPgZo+qZ8jzzjq2VPdcvIHBIwn3e2aZjdsdAehDgb6s/wiLa9GFHG8dEDkuSI4mCNG75phiUsOoVVsYaUrGiwcy0FJmQW9OzCKUhYtQdaQn4UhItFf3494O3bToY45sy/j7+kwXMTAuhKtyJ2+/+dBHIZ/2czA/sQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31ca3bc2-2b6f-43fc-1110-08de52ec9b22
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 21:42:10.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6YuMORqb3gMVzIscZJ9ClizJLgIHuNT+kWiRenew+kux+mbNI4xarNpRulHtiD0aS/xHwPVH+tFwxB/0f63Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5914
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601130175
X-Proofpoint-ORIG-GUID: k3pmfR5D1VRaaSG3OTMLEXTQtHH16i14
X-Proofpoint-GUID: k3pmfR5D1VRaaSG3OTMLEXTQtHH16i14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3NiBTYWx0ZWRfXzJWYaSgqadG8
 WPKeQFnTBhF8UNhplj+Drx2xguen5vnjOtWIHBkisLGmwq+1gox+CVm0OfFvLdKoqGMAkhdtL4B
 8WwRI22ooYmAmmTaO+AjioIKoNBesH2lbWP/ay8wNEWw12GkryWK113Bn0GXuwNMyXQqrekoSNK
 EbaShrbmVW/sOh40ICDd6UU6W26zeqDUYd28LSvPOuNLeLeoM6bgC235ZumU9vhU1DxFlWQHmBK
 fzPi0ljerEoYZPEc0T0/2cppaAo7RBSTf29LW7Wao/uwy7a9GW7ro3/7bMH/MkBG8ftUTACswMZ
 W0CDrR6tXsStIP0d1JHx2aS7WeBMVOftn/gngU+NEpbe1hmhH93NmKdfkMMk/cirXr1XQ1jeodz
 LUlKKLah5H/KOnubajuS8l5U3Pinb3YJ7qihBv/iPdg3ZBG5I5muNUXgHQOoS5svUFtPMPHnsqz
 TPdkknwM4NIT/XHcHFQ==
X-Authority-Analysis: v=2.4 cv=QIllhwLL c=1 sm=1 tr=0 ts=6966bc36 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Rll2F_O5yxex1jawJBQA:9

From: Eugene Loh <eugene.loh@oracle.com>

The char array prvname[] is set for each provider.  It is used in the
file that implements the provider.  It might also be passed to
dt_sdt_populate() via a function argument.

However, dt_provider_tp.h also defines the macro GROUP_DATA in terms of
prvname.  In turn, GROUP_DATA is used not only in dt_prov_dtrace.c but
then again in dt_prov_fbt.c to define FBT_GROUP_DATA.

In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
the fbt and rawfbt providers are combined into a single file.  Thus, two
uses of prvname collide.  The in-file collisions get resolved, but the
cascade of macro definitions does not:  FBT_GROUP_DATA ends up using
"fbt" for both fbt and rawfbt providers.  As a result, it is possible
for rawfbt probes not to be seen.

Notice that GROUP_DATA is always paired with prp->desc->prb.  Therefore,
simply replace:
    -#define GROUP_DATA     getpid(), prvname
    +#define PROBE_DATA     getpid(), prp->desc->prv, prp->desc->prb
This makes the code more compact and relieves the macro definitions from
needing prvname.  It also makes the FBT_GROUP_DATA macro unnecessary.

The format (FMT) macro is similarly renamed and redefined to include the
probe info.

Add a test to check that a rawfbt probe can be found behind an fbt probe
when the probe description has a wildcard provider.

Orabug: 38842114
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_dtrace.c                    | 14 ++++++-------
 libdtrace/dt_prov_fbt.c                       | 13 ++++++------
 libdtrace/dt_prov_rawtp.c                     |  4 ++--
 libdtrace/dt_prov_sdt.c                       |  4 ++--
 libdtrace/dt_provider_tp.h                    | 12 +++++------
 .../providers/rawfbt/tst.wildcard-provider.d  | 20 +++++++++++++++++++
 .../providers/rawfbt/tst.wildcard-provider.r  |  2 ++
 7 files changed, 45 insertions(+), 24 deletions(-)
 create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.d
 create mode 100644 test/unittest/providers/rawfbt/tst.wildcard-provider.r

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e24..102afd84e 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -243,8 +243,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		/* add a uprobe */
 		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd != -1) {
-			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
-				     GROUP_DATA, prp->desc->prb, spec);
+			rc = dprintf(fd, "p:" PROBE_FMT " %s\n",
+				     PROBE_DATA, spec);
 			close(fd);
 		}
 		free(spec);
@@ -252,14 +252,14 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
-			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
+		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
+			       EVENTSFS, PROBE_DATA) + 1;
 		fn = dt_alloc(dtp, len);
 		if (fn == NULL)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
-			 EVENTSFS, GROUP_DATA, prp->desc->prb);
+		snprintf(fn, len, "%s" PROBE_FMT "/format",
+			 EVENTSFS, PROBE_DATA);
 		f = fopen(fn, "r");
 		dt_free(dtp, fn);
 		if (f == NULL)
@@ -300,7 +300,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 	if (fd == -1)
 		return;
 
-	dprintf(fd, "-:" GROUP_FMT "/%s\n", GROUP_DATA, prp->desc->prb);
+	dprintf(fd, "-:" PROBE_FMT "\n", PROBE_DATA);
 	close(fd);
 }
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 3feac56ea..8dbf9740a 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -53,8 +53,7 @@ static const char		prvname[] = "fbt";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
 
-#define FBT_GROUP_FMT		GROUP_FMT "_%s"
-#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
+#define FBT_PROBE_FMT		"dt_%d_%s_%s"
 
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
@@ -508,16 +507,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (fd == -1)
 			goto out;
 
-		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
+		rc = dprintf(fd, "%c:" FBT_PROBE_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, tpn, fun);
+			     PROBE_DATA, tpn, fun);
 		close(fd);
 		if (rc == -1)
 			goto out;
 
 		/* create format file name */
-		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			     FBT_GROUP_DATA, tpn) == -1)
+		if (asprintf(&fn, "%s" FBT_PROBE_FMT "/%s/format", EVENTSFS,
+			     PROBE_DATA, tpn) == -1)
 			goto out;
 
 		/* open format file */
@@ -583,7 +582,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 		}
 	}
 
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
+	dprintf(fd, "-:" FBT_PROBE_FMT "/%s\n", PROBE_DATA, tpn);
 	close(fd);
 
 	if (tpn != prp->desc->fun)
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 709f7040f..e3269f4b3 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -56,7 +56,7 @@ static const dtrace_pattr_t	pattr = {
 /*
  * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
  * We need to ignore these groups:
- *   - GROUP_FMT (created by DTrace processes)
+ *   - PROBE_SFMT
  *   - kprobes and uprobes
  *   - syscalls (handled by a different provider)
  *   - pid and usdt probes (ditto)
@@ -89,7 +89,7 @@ static int populate(dtrace_hdl_t *dtp)
 
 			*p++ = '\0';
 
-			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
+			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
 				free(str);
 				continue;
 			}
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 74555f5be..ee2cc3c27 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -54,7 +54,7 @@ static const dtrace_pattr_t	pattr = {
 /*
  * The PROBE_LIST file lists all tracepoints in a <group>:<name> format.
  * We need to ignore these groups:
- *   - GROUP_FMT (created by DTrace processes)
+ *   - PROBE_SFMT
  *   - kprobes and uprobes
  *   - syscalls (handled by a different provider)
  *   - pid and usdt probes (ditto)
@@ -87,7 +87,7 @@ static int populate(dtrace_hdl_t *dtp)
 
 			*p++ = '\0';
 
-			if (sscanf(buf, GROUP_SFMT, &dummy, &str) == 2) {
+			if (sscanf(buf, PROBE_SFMT, &dummy, &str) == 2) {
 				free(str);
 				continue;
 			}
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index f131b1e02..406609d1b 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -18,13 +18,13 @@ extern "C" {
  * Tracepoint group naming format for DTrace providers.  Providers may append
  * to this format string as needed.
  *
- * GROUP_DATA provides the necessary data items to populate the format string
- * (PID of the dtrace process and the provider name).  GROUP_SFMT is like
- * GROUP_FMT, but for sscanf().
+ * PROBE_DATA provides the necessary data items to populate the format string.
+ * PROBE_FMT formats that data.
+ * PROBE_SFMT is a format string for recognizing PROBE_FMT data in sscanf().
  */
-#define GROUP_FMT	"dt_%d_%s"
-#define GROUP_SFMT	"dt_%d_%ms"
-#define GROUP_DATA	getpid(), prvname
+#define PROBE_DATA	getpid(), prp->desc->prv, prp->desc->prb
+#define PROBE_FMT	"dt_%d_%s/%s"
+#define PROBE_SFMT	"dt_%d_%ms"
 
 typedef struct tp_probe tp_probe_t;
 
diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.d b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
new file mode 100644
index 000000000..ad9f4c779
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.d
@@ -0,0 +1,20 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: rawfbt probes can be found even when a wildcard provider
+ * description also allows fbt probes.
+ */
+
+#pragma D option quiet
+
+BEGIN,
+*fbt:vmlinux:do_sys_open*:entry
+{
+	printf("success\n");
+	exit(0);
+}
diff --git a/test/unittest/providers/rawfbt/tst.wildcard-provider.r b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
new file mode 100644
index 000000000..b34a52d2f
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.wildcard-provider.r
@@ -0,0 +1,2 @@
+success
+
-- 
2.47.3

