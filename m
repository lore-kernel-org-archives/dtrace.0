Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4351DFCB
	for <dtrace@lists.linux.dev>; Tue,  1 Oct 2024 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727812612; cv=fail; b=XOBw52ZEDo/ZaSLXFDyiij2phQqWBFkoKqwFFDDqE8bc/RzRF0i3aZNKG/+5kqNMiLqEkit7hIUc2qJsbyJbH9VjcIEWkzl8vmsheMb1wyDXS4u2V6UI278dN8I+tFdMvdqpOC2TdYSzKUN62Tpa0Mc80Hkl438HLtYWLeemTQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727812612; c=relaxed/simple;
	bh=UiY+exO+3Q2Qnvl8Xjy434b81xhq0BZrz8Inb4wRIjo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=JoC7j+QA/Fy5T+aVwKZisCQJQO2YC/Xt4E2+KpOzHpJilJ6OnXQUHRUClIu9HTuIUrLP1IER3sBh3EQH+i3A9AyXGFbPHfeYEmafHwMHNjomcSMUYNHHhlPuLhGftbsVtUJ800UGn2c7KWUnDq6NAG242vAXYWqzuttaLDd0luE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ViwlZmvo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v6QFOycx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ViwlZmvo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v6QFOycx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491IfdZE021947
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=ELjbf61a8bgI/w
	zEZ2Nxv4KOgEW4wx2sDjSLGul32tQ=; b=ViwlZmvosfmGGODTO+4ONyqLdbkEeb
	9vn8W/pWbWzheFj0QgcQOIIgWpatn15A61tgY8ZfR4WBjAsghAjz+t/akx7V3/QE
	pVhu3P8ZPR6RJhKCYq4/kgm1ohyeL3QX+S7grGcC5hNetpbjvfuPqjxItdY4pGCQ
	tz5bmPIP7xPUE3GciBOkH9eeYMd+kJHo9pWzC244M34vquMKwmkfuo//vSm/5dQa
	aoa1LkZhE2eSo9Y+nQz7ZCu7bCrotPHvoxbm+5kFVF1SOnqCJIHx8eKj/BRFohEq
	qTRBxVjbWmG/zSA8JN61iXwvjVREx4kS492MssfZNWOfkohx74WbDDAw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d76nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:56:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 491IjEa4012510
	for <dtrace@lists.linux.dev>; Tue, 1 Oct 2024 19:56:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x887sm78-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Oct 2024 19:56:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL8Hw0Kb7jLqX5+QkI90oRBUurf8FmNEov0FmnEtNQa2vBN8B/TGS3FCtD9GlTgnw22gy2ff22jALsoN1SgaIZNX2jBjGPID5H274KgUHi1iv/nTHy5LS3NjX9uhxKpR52ul6iW4S/9BF3yoZwEmZWyfGzKqwQsWwk/ZWq/9ZpC8Th96nuxmUO3/HjDqaYnU/Sqem/3ztnR2wgq8u/DMbZVwWOkBc1Pcnp2EWIhmfdCTHlXbKATf15klVgGlDONLShc3kHHDVxklbnNhWvryRQpx972m2v24Fb4pc7vJ57Y8hUp93Y/VnlpZzgcfo04inATT2q+bqEzkaW9sLlOA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELjbf61a8bgI/wzEZ2Nxv4KOgEW4wx2sDjSLGul32tQ=;
 b=bY3El8npUp+PPu2m6gpxpCIGtCfgWu1155clUphvq2hNtv4YWNYxxR0K0N/i0iJqvuBTKDFg8+SyN57LNngp2H5lmkVYX9AonOPEAsmh/F9XbaHC6C3SqxWUInC8ferfzCvUeIkiXKCwBVTRh/3Hd/cuMkMGEb2v2aNODaRx5uahsOq6mATaHEwrWCYyEXBoc6bHB2Dy+Cw4tYLjb+p3EA0KMrGZbKsFlSKtnZaXoiOJPWk41F1HBWxHnHRHRRDoLmkT3qqs/Usw+3hU7mnN3NQe6AmyyKEp/n091kjd63tghrwIeGXm7EUz6yyfrASCJmTc6sxMeEuT5r+8tKZyZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELjbf61a8bgI/wzEZ2Nxv4KOgEW4wx2sDjSLGul32tQ=;
 b=v6QFOycxEwnHbXoNPOg3+gWq+3PyykBo6s1LIl2eyfpJ/vZMsFu6zqff5nImA/MNisMiNvQaum3PAgLrZA1gdTSEFiXvLAm2yYHlEk6YfakRRc2xlLPMJjd3qHNvdOtjClmmbImEE7ZHvLKuFuwb3slgKSPZIDCv6BJptIAJj0k=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by CH2PR10MB4133.namprd10.prod.outlook.com (2603:10b6:610:a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 19:56:45 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 19:56:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Alan Maguire
 <alan.maguire@oracle.com>
Subject: Re: [PATCH v2 2/2] ctf: work around binutils bug in
 ctf_link_add_cu_mapping()
References: <20241001195452.223321-1-nick.alcock@oracle.com>
	<20241001195452.223321-3-nick.alcock@oracle.com>
Emacs: because extension languages should come with the editor built in.
Date: Tue, 01 Oct 2024 20:56:39 +0100
In-Reply-To: <20241001195452.223321-3-nick.alcock@oracle.com> (Nick Alcock's
	message of "Tue, 1 Oct 2024 20:54:52 +0100")
Message-ID: <87y1371ts8.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|CH2PR10MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: 376fb747-0c1b-44bd-5ea1-08dce2532d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SaT18gQQob+ZMLVB5Sfb2Zcw+CVCyVNmtlgwvnHd2s7iwePQKCu7dItITwd9?=
 =?us-ascii?Q?pOc1fehii8AQE3s61wB4LWPMyy/C52kGf05lKNa692mmnokD6umsYAzhiW+Z?=
 =?us-ascii?Q?WeOaM0li4h5Y/F+tjNC9a/3lkUt5WuI1L89NHGOpubdjtPzkM45BE258Ipox?=
 =?us-ascii?Q?pyPDF23inDwnVAoCHmEbuvJkJEbXdbcWNizGhpiHP83cye2leulacvqE/acp?=
 =?us-ascii?Q?PKv04TktvpEl/sww3y7aDgKa4wHuiNrTE3vHSgrVFqDBaLwagIhNscR4rAfZ?=
 =?us-ascii?Q?/uSpj14WKc3No+i7foZziWOwzO6A9BoHLN1ety/qo1sFiO/2dVVLnQjPxTf3?=
 =?us-ascii?Q?PVPnfhDBiRfQdC1sfhxdZ3u91PxOIbCyUFQBxZfRVpO0/cWLBIWUmXGY1/OW?=
 =?us-ascii?Q?XLwXY7RLV0EPMYRBqsnX2GuyMfgj2gx7s26Gd0TPsZacJEoNAdSEv6b80lWh?=
 =?us-ascii?Q?V91z+XyuQOadvcwETJ+eNWOTe1dQVHEQuB4Y1OESKJ2aJ6LOayRsob5Co7UC?=
 =?us-ascii?Q?E1hYPw3JK5GbBoq7UWuNg61Bspd0KoFjsYsaED2SW62PGz/GUelihXYRKnrk?=
 =?us-ascii?Q?jNDRvUbqADHQ7MYO9dxSc4lK8aV0VrtKkS5m1Lbpyz1m+yGkThhU7uFlbTcf?=
 =?us-ascii?Q?wckt2UDCQwqWrAfklRy/oHNN3cZkx8QGAwikAUwaTebBG0nyCG+LnBwtO1bd?=
 =?us-ascii?Q?Zx1zv9HjlebqStWTa6ZD3/YRkGIJkD4vkEAoGa0G+hwnkimoYqu2yqDDzvSB?=
 =?us-ascii?Q?UtEpe/oGhL6a9/G+ffKe8+aBlm5JnPoBuWWypOumDa/umnpZPrrO+NGPPcZE?=
 =?us-ascii?Q?CVq9Sb1pjNwazexf5OZb6v9b57C3rGv+ox+PVU08qYpQs9tlFZOXrxSQgEkI?=
 =?us-ascii?Q?doIuefG//EGUiYG9T2rLoDzf+ijj1ae6STbl2t27sqRdG4qZ5hAWQGfI/DfY?=
 =?us-ascii?Q?DTnkjknwKWvhSl0Agihw/01GjwX1HG+1QNr9vvv+7915tp6CjtShaufS0Pmx?=
 =?us-ascii?Q?/ErY6V8dE5ZZOuC6nuqo9aJ+sLzMtEGWUFcIPClyPKt9R1sbdIo4MsNssEbb?=
 =?us-ascii?Q?Vt2s/vPREcPIKzRCstTsAQ05NaonR8m9YmoOL9S/Zz47qbltdVnr6zBxRUs+?=
 =?us-ascii?Q?5v4QQnX8PUZRcXYqdQP2G295GzP7zsvqXTjcZ7icuJUr4qpM2/yobx6/1NyG?=
 =?us-ascii?Q?Crw+CXyS0hTNErnxQNnEWwVn8S4c4r3JbUP1WXo7a+mWd3htgkROiXmi7Kc5?=
 =?us-ascii?Q?aLQ3uZiRZAA2tln1KU7t4Txg7gCXLCHJ1LuADLAbnQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RaXbn8My8uJiG0OHvFUUBCciDmWOJXSVZxdAtsBk/D8B4QOTNXtjlRGa/out?=
 =?us-ascii?Q?Y7prHHXxM/oF3mFOn2Bi+LxPwHLF7Skzh0dIhfbps/trviopKFirhGGSVKyv?=
 =?us-ascii?Q?cTPfkWroeJGeY3zRx9Nq1l+oKtMmwdF/8qtDWaDTOCBNMF22rZsovJ1Gda/O?=
 =?us-ascii?Q?IBnTwfkRuqNKMG9UJooIlG5evFoLd6GJlGzkBCIUpe8ax+UjDa3pCJJGVE5h?=
 =?us-ascii?Q?PHDBqgjvOc8seXNz1utZt7JfKkODPsYBV57NkgVLl7Uh6wHG/wXz/oP2uQx+?=
 =?us-ascii?Q?xV2LMblz749z2xXFoPEeoTEVU/N2Jf4yvS74BVmsk+2o5kcRFqFaYQyXckaD?=
 =?us-ascii?Q?EYJkelRJGt2egE/nwTL15ZG/BINqtQKJyV/rJhUKi6Ej3k16Rw771gPnm/5v?=
 =?us-ascii?Q?sZQgTakT+MjhaBSQG8ob43yfSxXCJcrrX0q5+grFirgecVolYfUKi2H7SgFH?=
 =?us-ascii?Q?r48WEjII2X3WQgLmUWgUAn/Okmfe/UobeUBfo9ZkOgCx3M0cOFJERpZR8TdU?=
 =?us-ascii?Q?mDDiSV3lgBxMmMupIJ203vsZ5ZRhGbCwAS7ACmlULBzgTc1XBs/5XQ0BGea3?=
 =?us-ascii?Q?xC/BLJAabfSbiktNyzhkCMY2TDhIVUgspaAOp3aYHPjPDD1YcT+kmAKmzN6f?=
 =?us-ascii?Q?+YoW5yw2sWmvTk1p/4X15fmd7pLDZWzordF/hK/kjlg5BLCYRmN9LIdWQX0a?=
 =?us-ascii?Q?M+yDEUjdbdEB8WsXETMfA+NmHdN4Kf1EGQGKOgoWB9DVVKgPlXIA1T0YTEvg?=
 =?us-ascii?Q?mpkv6hIiqoLZFnhJwFhJbHKAgWGcO/90JYfcvyy2sgqGs2BPCxX9/q0UhReh?=
 =?us-ascii?Q?hqNbeM4G8+r61WjkgkzlLMnmxlMxZIuJz3uZY/kCTUdPvfSXrpxInt26lloX?=
 =?us-ascii?Q?Ra/cVQWslczpkQ/09DFyukKSTbwhIfVGyucBZkB/2zF8kTTeVTdlHOqtQqwm?=
 =?us-ascii?Q?fH04O+yTjX5a34ABdW2+dvM0jjY866IlCr4mQr2TWq8Gdm52iTkdMN0YIDLU?=
 =?us-ascii?Q?vIgmJbXHw/CObN4TckTrHsQ6f9JOReml1wxqrAN3jefHBwu2/Wae2Zzof9xG?=
 =?us-ascii?Q?zCWaQI9ddATuYxIXaZxmEfaGClcdEX/n8UouM9HW0LOtm4ZBnMUX0w6uVP5Z?=
 =?us-ascii?Q?RLcpm1wFz3PdR4t52NIcY3824XG2dcwGZDqA/goFui35RZQpsi/exZ6fALPX?=
 =?us-ascii?Q?eGxRn3yyEyCh63mqec8Y28b9NLMu8gWyJ2ZlexKczO0185i7sRWPvBSubjb2?=
 =?us-ascii?Q?4ufUKrXTzHLFwCNPwN5jkdt7gMkimR4/QL7KMuba94WieNR5kmyr7zIEOW1K?=
 =?us-ascii?Q?zPB+e2C9cfJ31BjEirn9i4Olxb/lU/OSG0YhQo0k6aDuyiqFP/84LTmcd/rK?=
 =?us-ascii?Q?mRbUmciKVP1WYF1d3dzRP/V7Ols/sZTZlST6Htp5TUrKtzWlS8/ib5VQISgX?=
 =?us-ascii?Q?sjwtf8dqE5cVlo0rtYfSznSO5pCCGJUUQ4/1z/EyVNIivY90MynmYnnOyJVd?=
 =?us-ascii?Q?aL24Sa6RAmgHQHwfsfsH4sAPNpnVN3N0e0xb1Re584XgY9q/26//TwnTveAG?=
 =?us-ascii?Q?/+OSFUoaaOmrILn/ypryo5ccutnTv/6N5bhQzRvaCd8o0/5E6zpIUwLiVdCV?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Sez4Wp8NVqJsn7YgBnTJnsZ2JUqpII/CGKuY1nwWHLGZqV5KnIrduWfgevomkcMcEXYILkKmbR8HYjk5FuT6Jm2j/fVGecozJm/S3hUCoeiz7I2kmb3oGoxLRKicTeo6Gm1moXOUBxXp4qlD5LUJGKkZY8S18IOKmrIXqZ3SOn8gEXbjjvdJXseEMtRJ1u9Wvr6nu0X2D7u4/btBXP8X8CVyHNhO+HU1AQv8zaUiXut2FcMbfdG+hsphP+arJfIt51IbOU2OH0njB9caQC0WBaTIcvFLKoEQfwjLDHZ5U1jaRw3MCYVYKPiXnez/wlbOTAXFOj26ZdtPQcoVPqxdrJC8W9h6lNKji/kQGMGfTvasulH7OKzwXdOSZcX7icmWA9oV/G7rmejD0CAa0R3hQY9THs2Cbjf2YT8Q+zIgLuADMsRaFUNbvnSbYjbiNlN1PKWNZ5H1slkKVLPSiik7UsSHMA8yovea2m2OmJJln3OB+xEkSB1mbMme/mnFI5OKbwlpYtBNBuo9aH0t1onNkWJ/zJbIvquwsCbRGOLLyzrbI/we/8X8BH+UgefpntpUnRK7hTNBOH95Gx/mZiU1DyvcBsK+vz8vgFBxaka9b4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376fb747-0c1b-44bd-5ea1-08dce2532d6e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 19:56:45.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbumbnYR/DfzfK2uPn0fuHERNbpRF2dDGDORvFUp2eiKH3H3ip0/5wEQq7lXmf3756qXtQ8PM6+e6cSCMr5eRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4133
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-01_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=693 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2410010130
X-Proofpoint-GUID: ZVStwwHxN37IKRAybfNmDjswBzF7BlNM
X-Proofpoint-ORIG-GUID: ZVStwwHxN37IKRAybfNmDjswBzF7BlNM

On 1 Oct 2024, Nick Alcock told this:

> The fact that we need to *implement* a hash table means that this adds
> almost a third to the total bulk of ctfarchive.c, none of which would be
> necessary if we could rely on a fixed binutils.  But we won't be able to do
> that for a while...

"A while" has become less extreme, since when we move to CTFv4/BTF-in-toolchain
building, we'll have to bump the required binutils version anyway.

So btfarchive will not have this horrible patch in it. :)

-- 
NULL && (void)
