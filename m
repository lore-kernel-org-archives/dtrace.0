Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AE30CD8A
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756493139; cv=fail; b=omVp4dtLB9VoCl1tQl96qsddCL6rTJGI1g0NG0cmLeeY02ZcYAQUgDbNWKhNPHsv3IOf/9rZv6lPh69l4K0uCvVz8AxFm+ERbmA8I1AksoROxYdwYvu3XQDt6MTlRRGvGnPvT5C2Xis9kdaqKMz0uQOhk873A14ttll126bgY9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756493139; c=relaxed/simple;
	bh=PvpLZhnW8pb7Cb5uwJX/FesBWDKMeX4Y8r84OKqvPYo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=GJdjpcL57pkAPzKF3RLZWEk/8cYXBdbqylVrdvRvkzCb6O0U0ZtQxBgRAt8hO/EzoqSkjp8rjK10dK13GRWHbteDrNDLPLas54dgblmCcggdz0nCogFnIQdTn3ILpYviKTTCClNXrci0tsMFj/PvlynUVPMjBfHque+OeMqDWsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kKSzpYf9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NDr/GOur; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kKSzpYf9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NDr/GOur"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TGgAP6005751
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=TdxEWE8WvXhuZ90qS+8vvWmXbOaInIshFgIV7z8Su/c=; b=
	kKSzpYf97I7waG0iThahMYOnF1uKq0MpwmzBMGFrZyPkHW2K9PpOYjJ8RMlFcLKo
	WkyCRCufdxJw3z1M7gkjuoY8Kktl2zbOzHG9dfRjrncHYFznGYOtfmPm1W08LHP2
	fbLLPF9s5o4fN1ZPzT1R7Q8wfDcJmmVbqfpl0WwT9RDXs3prmS2hfea7hqyRk9xS
	eXiOdlte6XhCWKssFR14is9iQTeV6xiIJmzijc7bWrWZ7iq5Suf/O51C9S8K6JK4
	HoU3YChLIIj0VMGN7BHpfF03sGUpL+mY6+ebiDpgMPN/Du+LeUb6Uq650regv721
	CRvYzu+MDXYtVdW+JvzpWQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4e2b5re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:45:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57TH5A9E018982
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:45:36 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48q43dj3g5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Aug 2025 18:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B93vFRnRacF8/1vrYN9IDhgJtkJL1+DIGqHJvueI/3tdj+NCjKnpn1CKUcPI/DJD0l9jZg2T6CRHVDEiWPbT6MBER4TWOORA/S49H8wUxHvx+P3GScrvXpmp6imVBhUYa92fIyWQwdh1rKdIxLVRcuxWmbGUBIj1Vaij8h+uUTNN1lMb+ijFtyj5wMQWVB33wDPDkv5xP19N4e/T1NK9gSnA2hqjI9vUaLRGGvQf4KG2FNb3yavSVtrzYSlubbjrr0YmLNJ4yo8ArK/72+lWxEy+goeJCBQWRqxKicyNoXglIydrb12Jz2XTEHRIZb26OEgOzB1xFKrkhX0eSqYTAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdxEWE8WvXhuZ90qS+8vvWmXbOaInIshFgIV7z8Su/c=;
 b=Awp8TlhAMLUEnL3TvezT10dlsnhkWs+fPkcQcDX9rea0O5cUXl/4uIhHGe9moU2iTxNERr731DzhtRDBlGNVMZvgzVC2suZ3fcXTo0BFOXQ9wNhBUPuvERiXZby6dALG3K1kXW9QFjnfngFUk9Mo1uvSPml4DXA9yfPevOnfnIMJGGp704/dE39bCmaWq3XxWYP+8FWYsDDZ+fBsPGoW4E62H4VrrPecoKXIA3JJmCb5/of8U+pWo0We4IDuwxXuTho4S+/fCDZHmQ+86R3e7TehsRBN9U+RwIBYFjtIsXH9SwIgMME2V+Af1q+jCKgile1J0/LA0tzPjWICnNXpXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdxEWE8WvXhuZ90qS+8vvWmXbOaInIshFgIV7z8Su/c=;
 b=NDr/GOur8q9jiEDfHzevKZlry6q5OuA8OWLCDmIXK4urqGyqLzBe1yqXPhz+49+mLUVBjemZv2rquZraG8bTOobXpZEBPS5SoAQi/Aq6FSBNNUZsvuyB/p76KhKbxqRLmO6vyTfdV0GSWWpCHPLwtNkqG4j53vHnBdjxSI2xnJw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB6710.namprd10.prod.outlook.com (2603:10b6:208:419::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 18:45:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Fri, 29 Aug 2025
 18:45:24 +0000
Date: Fri, 29 Aug 2025 14:45:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] version: fix DTrace version string
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567255EF643A5D1909C838B4C23AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afd0066-28e2-4020-c13e-08dde72c3662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BSgC5XQuwCv59EVcb5eCWF67GrA7SijHE4aq84Hdhe5zVzJxdK5SRExcC6AR?=
 =?us-ascii?Q?Int0XtMOhviJMw2p0625dm2k3aGi/8SkhrQODccJbPgHnt5XDqbwfbtaUscW?=
 =?us-ascii?Q?YRe4vGNtKfNYmDzQO3e1/cIvPvS6NgFHoY+DVtS6YCvB5pirSm2nmIfzmlmH?=
 =?us-ascii?Q?EUk/gk1Gu1NQT3fd4X2LoV/GdrhkTGhR6LuCQjCK1qkaHUM8GsmcXOo0357e?=
 =?us-ascii?Q?DIn91hrSssK43LthXezkt4YdA9rh4/d80RfJh+nvg6cGTRPZ/ULAuZCexsy5?=
 =?us-ascii?Q?E34znW4kbiKlny8vUtdkxXg+0EoXhh2BEsQX7ubfkY+do8VASEB7F0nNxwFq?=
 =?us-ascii?Q?JN7SuHUOiDbyHcJHA4mD0FSLwkfs9nqpljN4vVPjLCUD91DDRiy1i97jLja8?=
 =?us-ascii?Q?4N1wr9J+3MoXqB5uF2VItbielbSLsyGoH5ifyaAKlPZNkizu0IpaKYgp9fek?=
 =?us-ascii?Q?gUsu1MwCFaLchS9yO2O1fqHOL1BUR1OGn5JGn4GDkbvRAtcTOjVGso4tyk2N?=
 =?us-ascii?Q?530VEZPxlgctNNKE1mQ2xMw2zRqudpGeSxM91TMyxRu9A5OMZMmgRrPXUCDV?=
 =?us-ascii?Q?f3Cw6eN//DYK5E5Z1jf8gvsDM2dVPvG5lZIUHV/yCYr9sJTCBdy+lbmdL786?=
 =?us-ascii?Q?dFkYjN+QNsGA2/PnvZ/ncOnT2p7lOXpb1/b3oEXr/vFk1AMoi+mZNf78aB9J?=
 =?us-ascii?Q?t/kBvlE1yGW0f/ayO6nnKj6UF+2Jh0YwF/Rd/wWx4qv3WNh+dWJH9Xjau4IP?=
 =?us-ascii?Q?Y7oUnbgU7HdyAP/VGz5BdMU/+flGr8KuAXfZSmhUrH8FdCvVnSWRwwxtBSsL?=
 =?us-ascii?Q?2voKk/xJUsleSeE7qaboBK7JqotRl1XqXK96r459XiR8TC41lYvfr7FVaDJh?=
 =?us-ascii?Q?kMOrjkrwZVBpxWMtTGBiF6CEBiW+3+jGpxMJapJlX1IF847sQ5CtOaq/8Obj?=
 =?us-ascii?Q?EqzyALzu+JrqZVRyvI4F7KCG3mkAacw9HuDA9amnwU7oN7qGzsAXr0fALWUA?=
 =?us-ascii?Q?Sh9Lp+zVSVgTa8FE/j6a9K5R+tNY0eD4T0916WEI0NqXor91jxY/4/RK7bA6?=
 =?us-ascii?Q?dlIt8LMCobL8k/477iD8Mvj6twRTmy87/p5fHLcQvy7R0pl4smP89aE3OLmr?=
 =?us-ascii?Q?BjUyvdQdzLSKhkxerAegh/SibRhf117NtjCfuRcLMcWfz6tlKRbqNaNNyBZH?=
 =?us-ascii?Q?A4RReO9ZedIsLX1fQgr924inoBZvjx2FG4rRSfd7sPIoTeTjH3D+u1CrG2L2?=
 =?us-ascii?Q?G+4lXqnsqhDH/sEVxNRZANowPSijtI3JRUlFQRonbh+q1fxWQsjLoUGWUUj8?=
 =?us-ascii?Q?sFSdicgm87V18ESQ4vRHah0x/1wPkiGcDP4socxdgqx9LthwJ+kxddIPH+9h?=
 =?us-ascii?Q?VWpom71vp4jRALpccnD26XSJJfUgR1ORKutF8hprpsE4SN39sHFCRH80/qPG?=
 =?us-ascii?Q?bLlOOWn8BiQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3HkEgc+dhT/4n1zJ9wKfctEAajAiQy3WsanlRa9WIvVGKdJ+pwNQaQPnJhDZ?=
 =?us-ascii?Q?TaSovOQPVIuOSH2IKYlcz1X5V07Xjks37mjtBrZu+qgE0tM7rmnLzOvFyaa5?=
 =?us-ascii?Q?cO0hLZliwIKUpJtgN4S32FkNyGugtPYrudaSQbDzmr/6CQrhXJMR5rZCG5Dv?=
 =?us-ascii?Q?jZvyM6woedqUjPBrZFSOnrqnH9qp5ER5mI9Bp6xoXtCkB4ka0L3Z5sDVqVdo?=
 =?us-ascii?Q?XzUzoXoAgB0e6nCfDMJYnDWC6KiJu8rHPsmVa2DTniWrD6rBjYofu7FBVGxp?=
 =?us-ascii?Q?ae+egyzuOmRe+4427cAyrpl7IRolhKVMfxg/Q5I2zzRaYJn2BcosBNSatbo1?=
 =?us-ascii?Q?0HOEwd6va6L7wPzhJ/EjFz0AQFJOdUAtWhIYtAfil7LoazyAUD9wK4wzzEmB?=
 =?us-ascii?Q?axpeW/ZlRKhAplqwy2Ui0RYqdI00LohobZ8hMXOwwpETpAbmVvRIBvK7CFqm?=
 =?us-ascii?Q?IUqG0Z2S5fEr5QFXo+qRinT9ypV9lzEf2J3XeMddiztYbBNxObAngZdxXulF?=
 =?us-ascii?Q?3c65eNVZw00gH1zjnhyNyOioKw5mO9YGs9TY7EdBChfrEACt/1vSXbANwMZZ?=
 =?us-ascii?Q?SHYr1Axf2UbcqBTptxNTL9nFIbdPsua7Tlap3TNdYlXpiJ/x6dIrlv70Hew7?=
 =?us-ascii?Q?vyovWvpKoVOtz5mHUFM8guvHVU6NUFRbQIPldPLlUt49FjTe6grxSjtScBt1?=
 =?us-ascii?Q?ewKprRd1oXdw2GG1ONZeUPKNIS0ztSgsn758zN004sIDMDQXj3zq8h8+62n1?=
 =?us-ascii?Q?S6xxpDbzQYmjQqtijVppZznGR3rqq7Qxy/pddLtLg91H9ABHeGuAjZDOiQIV?=
 =?us-ascii?Q?aVUJnoSGtDrp69ok+yftRCN8ixXzEB2tBZYRHDVuqirQ7MGjPPAu3jigynyj?=
 =?us-ascii?Q?eHmkX8Hs2o8+YeY7Y+YNNlp7+5+b1oEvGRuzOUGPes89vDkscdhh/00KF9Cx?=
 =?us-ascii?Q?lONaQNkcnqVFKP9fQjV8mqh8AwyT4PaiMYbh6pB1CNvUz5Yp/myGoHwmWn42?=
 =?us-ascii?Q?Q7hdr4tck8Gy9/sYyDAH+Q/vcpHcHvHWMNoW/G17Jnf21bhyxLxKkpFpYoo+?=
 =?us-ascii?Q?qUOEl+U3/mTLCT1qwMt4qkQ1JHAjgQ3JB/VZv4u5+ODH3PS0w265V8pUUzHI?=
 =?us-ascii?Q?NpEqtKRDA7zCzrHoUaqwDKmX0t/hW2/MJcDDCQVJicKqfhDyIn4cYhfENZ4K?=
 =?us-ascii?Q?nEubTQvPGVTHVikwfJby2kaAYvEv9ITAgTo+pdDPo7CM00Rpcmy32M9gp/68?=
 =?us-ascii?Q?6XjqyC/Ab0exBuB8vKRHgA/Hj+fx81+SJmtkQHPmnEOoX8W2wEUWwLxUYiJ+?=
 =?us-ascii?Q?PuIiCyNcrxJ3eT30Z6DCGpSyRoiOeolfL4GwRWmScX6sehoS6VH+E9+ZMypo?=
 =?us-ascii?Q?hv3FMvovcZSTho3hx/YdR7TKCbA1RGpFGd0UVOL4nmOLJzSV24DF0smfgQ+1?=
 =?us-ascii?Q?Cme3uv0/gPe/5FwF71KpQqaRj8RIsoTKO7XJBoRfauMWlD5J5CaWZ/ZWcg/s?=
 =?us-ascii?Q?w5VSNfK5a2KSqP3Gwt5+ARo9krYvo8d99or4X8B+0RQIFuZuyEXlr7YpNQ1a?=
 =?us-ascii?Q?6mhLEOGBE1eCEY5iX6m3t6sTjL3FYOm3HOrs7cxjdA5wMYtfy5bi3cAy6eCr?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AQDXhqgO7R0Fpd9bwLxUJEhuWF0EtTjGD563Rta8exbBYcjDC9YZDgLGm4WLjKpXnBSU7wHGvhW/iP6cDpBcvbNk5pyo3xDoplejYZr2TzFhVhFFDxqnYkUgX0NMnvRhvGL/CfX0M7f6qtXtFkAUn71ppWMpx1tP6BsNxBuROK2++ylIpRC69T5XA9B8Rfl+a0GUHIEbC0pmv5UeGMHVYzuCaFdkyxtr+WrZm7BSlkuqVbWdFg/7kmibnYQnzvhN9ZPDWoLH/KrQwj61C7sn8vfT8egSKnTxkEivQaMrlhJE+K7O6JRZ7WK9ssAvfTt+1PdeGGmuXQ2HHp65A8R894uwFCylY06fjT+p7+FQGIFxvDCdfQX2fyfdadtYzTlvC+hRgZchVc9auKsr75MyCtFqNK+c2FK/MfAlB1kJ+WLHTN2awIrgjf+KDO5p7uzasYLiPzd68Abkb4tM74DT7j+FmJ2j55sRfSbfoExEAVMgLBAZn9V9vY2Yz4P1y2yNf7PfsHrJKnGx6ubHP3uCCJhs8fpi/hhh49gZAv+wBCsB0zdOD9hD+xTpa4yrkHoOM8Q2/+XQvoqBXuT7mC4cLGoQEf+nOhLEeBZVBW/DxZk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afd0066-28e2-4020-c13e-08dde72c3662
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 18:45:23.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eK9SnwBckHrcQQSTQVfd0sZrYVHZ9peJ7xMz6hZjqOMHbZCAPhY/gJWY/uCywtDQSmeC+BNwkkk9NqigmA0vIgMTiv3rUSewbs6QppfpMO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6710
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508290165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxNyBTYWx0ZWRfX3rCrJFcfqc64
 MB1TA2rJ4lBx78F7XBfEj8f6wM+y/bnDDh9/sqniYonSeU7/N4zFk44JS2HBBULggrjbJ8qreio
 vd+fPEaDAR94Yy/CZ+eSIMsK9h6m5KM+0f1+h2EFTLq8R+cxPJ3CdZ/bC0yxzQNKKXtBHa00Z0D
 3I7073ibGuNZ36pZvWFFnyxA0//hws45DEoUvFkrWONUGJPqYrBu013lpyEVqsV0CEp2yKQezBy
 k/ccTOansnPy8Ls+9+jgphGATOXusyDIeocwGZCGxF67AsENQgww1F/pSr9NAsm1loaH/1aJDz1
 Wxwe+5fALpUi7eV3cpvCabT5VUswEIQMYj+pjYML0ClPbIgGKNg/ufyuCKHiLVNa0y7W5fVm0iG
 Kp/blkqI
X-Proofpoint-ORIG-GUID: _xTuRGbh4_UCk5tQxd2UU-cUxNFBh6sx
X-Proofpoint-GUID: _xTuRGbh4_UCk5tQxd2UU-cUxNFBh6sx
X-Authority-Analysis: v=2.4 cv=IauHWXqa c=1 sm=1 tr=0 ts=68b1f551 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=W49mXkiCHlx7CorgOy8A:9

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build  | 3 ++-
 libdtrace/mkvers | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/libdtrace/Build b/libdtrace/Build
index 3540d1c12..51ab0e4b6 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -130,7 +130,8 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
 $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
 	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
 
-$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
+$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list \
+					  $(libdtrace-build_DIR)mkvers
 	$(call describe-target,MKVERS,$@)
 	$(libdtrace-build_DIR)mkvers $< > $@
 
diff --git a/libdtrace/mkvers b/libdtrace/mkvers
index 82295b152..6f9240320 100755
--- a/libdtrace/mkvers
+++ b/libdtrace/mkvers
@@ -59,9 +59,9 @@ END {
 
 	if ($3 == 0) {
 		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
-		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
+		printf "#define DT_VERS_STRING\t\"D %d.%d\"\n", $1, $2;
 	} else {
 		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
-		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
+		printf "#define DT_VERS_STRING\t\"D %d.%d.%d\"\n", $1, $2, $3;
 	}
 }
-- 
2.45.2

