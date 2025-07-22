Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F6628C5DC
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181529; cv=fail; b=DK2g3m9k7zVF/CXx1OIISeuCo6sFFNbdOR/a/1prQOriH+uj94zPe3QEU8phAhmK8MSNQOt6uluYySqbW+fjZW8JAd4/SlEzIt6GhF/mgvs8DsjKiuIkTUXnuXcqYIBtn+K5P1QXKBo/3DVNFydnkNpWo6VMXLfovgK3qHpVAqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181529; c=relaxed/simple;
	bh=wo/Py+WueFtd4qo5ZpVomNvlcG64ESTlGdIdOYn8muQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=f0XELDq/TS0BQEPq1EbK5L4O1x6vLfyAzQpG/bW2llvFzPVWlsbbESCymE9rEXSsmI3/rOAxMQLEW2BPqE0r4lMMVTrfwDuTljqabFYRmXirhgCqqfJYjW069Z5aJMjN0RK9TTx2cSIQPfLtyGPUEbgy9jdVR+aLQwT3VwwjTnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mRIgorc4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Uq9x1tEH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mRIgorc4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Uq9x1tEH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TAEe024406
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KpyiApXYdht/6yQtXe
	sudPfyVLp7elWGbhT815EVudA=; b=mRIgorc4nt09bl87uKUOJn+WH80cRPn70Y
	Nm1SXguhgTD38kojUGIRfOkbozgThSWdNoLLYHXxtOaVbwsQga3c+bF/HS1/uME6
	UQg/c9cfCtxAYo8fDfMfKAQgFhG1Qdggj4S/sxAQdIhGddnkvJkflJ0cjQUaIQYB
	RxeP+G4fPdLjf5a1PwEOtAH/abrsy9iktzxmdn4Y09iptz4U1tx2Dfw5hdKyhifZ
	4IwdP1Srvy3+9PsIM7kVgFwDH//SVStFRSXf0twWxVgkfuVsMJ3RKa7Cc4KgdSn8
	M7JneTVk/RJ0fuvww3WnS5NwlyUT3nx4HvzOY5DPkcNPxol2xzOA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48057qw1bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:52:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9TZPe038374
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:52:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t96ccv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 10:52:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XPhNSJ9Ig2CsHW+LpmZBG0hSAgPgSvW1HINXYZqM+L90zhkXGprzy/buEe0xXT1OvYaQWhPfeJXGcqoob3ubMRyl63T85wcs7Ng9CY82Mk1F17IZjAJPzptS9jti9WRkkSSNFAfJ5FuJcTDKjBmpEjk3geupVid91JJ3M1wOB7bxbj3iubyYKNn92UCElnd7lZPJ2nsgNyqFjyCGCEv8711ysPmYAW1DkNojNhgwrECJ/7f/f6umPA0h8H6lZvRizZKInHK07XJ7RTGORCOjFO1qr2UYNY024/zTVcm/sWIByCgXmjGbDcmCr+uq6X0IktO8HDMxzS0X0p1X3Bo02g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpyiApXYdht/6yQtXesudPfyVLp7elWGbhT815EVudA=;
 b=tHsqvNeITgn4VHMnkPHqmSANpsAjaFS1jU9QJ98F7J4uZ7Ox7QbQvXDOlh2v58ecDfowHOWNHw2Ae4DIJWl6nvzVOBxZ34DgasUX1CoM0K8hXkEvd4k/YZ5ak7cMIOEg7o96lbge94sFcIKtkiG1R8vQh+0DBGfzUdZdRvaYetl69jcOUwYGh+ngW1ayzMnGq6hIqilOx5xX2wogygm3rLznsTYGH1ZzCWoqdqYL749C7R9TIE60BJRHkRVTa3AgKwtpMFsMF3zvsPKzRdGxOrIHwD1r9PctwD7xjTXmPsdng1RZyLRHPOG7VrGocgjBaW6WrawJXAPDfmoLUTCfCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpyiApXYdht/6yQtXesudPfyVLp7elWGbhT815EVudA=;
 b=Uq9x1tEHCXA1Jnx2l8v/smsoePP7C+0GKvHN6M+T1nCR1N521AcIKZCsJ80YJibsP7FknFR45zXHg/kf6Qn/H24ArxfMSs8B1lJnFksMD+/na0UTDVhgNeWlTZeFR2gaY8HRJWcfXALBPiZEYB8X6KV5IhIU494uZW9zjp7pUqY=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH3PPFD947D3BA9.namprd10.prod.outlook.com (2603:10b6:518:1::7ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 10:52:00 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 10:52:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2 3/4] Sync up the version numbers
References: <20250625060305.15707-1-eugene.loh@oracle.com>
	<20250625060305.15707-2-eugene.loh@oracle.com>
Emacs: impress your (remaining) friends and neighbors.
Date: Tue, 22 Jul 2025 11:51:58 +0100
In-Reply-To: <20250625060305.15707-2-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 25 Jun 2025 02:03:02 -0400")
Message-ID: <87wm805whd.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH3PPFD947D3BA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 1249077b-8347-43d9-eddf-08ddc90dc95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njhbb6j+licyGUBs7MoBoHVsDYmIKzlr9+fgScFWQXf6x/ghvSeVniEFB1Wd?=
 =?us-ascii?Q?582OGEZtiV+pRBS14bV3CfVsSEHknlZUSonPCk1WcDNg3pyf4fHSdgm2Vvx0?=
 =?us-ascii?Q?IXCJJpG7CggR0PBr8Ek2/6Mss2eW62NAw68STed7P/Tb5PZtr51WF8wOM005?=
 =?us-ascii?Q?quvkvS/XgrteTCBWtL28ilI1gRLkcJjeQ/bxEX2EqN4NlJ+pGVf3VbQK3wx9?=
 =?us-ascii?Q?sPXlAYMRZ0BkkLPwHAXfug8BWF++XTE1Zaw2yP3hk+hGPJTBjBhGiN/dFlrK?=
 =?us-ascii?Q?DxVFgJwyLdwM7kwaGpZ5/9ilQPfgeH2xGlu6+wWdSHlNo4C8Tw4gSIreE7PU?=
 =?us-ascii?Q?iz/XTRGTVTZ36c/eebm5j7RR00LbYN5F0pIjv0lDvz+nkIKFwkTiVveUzT9m?=
 =?us-ascii?Q?buQVkRWa+JZfgkxBBR8ILl6zfMg+OsXPgUFHk7BWx4unncKXiIvXGnHbrE5F?=
 =?us-ascii?Q?NwMImpsRQgE8X/rtRj8lNYxOqJgOtiCoJMbA3WPgCGB/Mr1pWYNDdgIyi91E?=
 =?us-ascii?Q?lJE7WA+MLbQpW7i1tkxXxihSZ9Az5PFjgYWdnYVaBJ/JJoIZ4ctzFF0fLdhY?=
 =?us-ascii?Q?W3MjWrUMdkoK86bS8aixD2TPvm6yNuLIT92HxSabGpDa51Ov6RlVWQbE/LVo?=
 =?us-ascii?Q?rBgVyLMFlQMhPknyz4w91sZ2/kuNkeYKveOz6NgEKU877JF3ERidt6g/gx7f?=
 =?us-ascii?Q?NxsKO4ObAwvNas3RR8PpePtrMjDkVfHX/v9eI/l40MDcVJr1Kgs9DJaYYR4x?=
 =?us-ascii?Q?UUsC1N8Nozg0JdxDvYS/s30mjxRyM5oi7K2VL9zxo5ImkgWmO84Eq6p3vo+i?=
 =?us-ascii?Q?r+JBp2y4KvEwbK0Kf9X3zKe2YESPZ8V/v7EbjzNoyUkrwV6V3NbwAh17k9d2?=
 =?us-ascii?Q?p/sCSnWln4n87zqAJLYCfc3u88OQhw+Fxa9qIkORcDrdO1HnxJTAs3E65Sk4?=
 =?us-ascii?Q?fryk1q3y/VRowV921M6+kDHxb3vi6d4PASqDin9HYqe9cltxIIq6chFRfRre?=
 =?us-ascii?Q?lnB27RhBHcnUvoLUX44PJK7NdY2NI9Pu8KicCICCf0RANJtIZLPBMvs8P5ao?=
 =?us-ascii?Q?YHgrmPvTzFTXicKSbqRXXsb4fUCP4FdY58nXs44mv0axIb0KxuIt6G14zO0M?=
 =?us-ascii?Q?SAGFpf8HnEsT+/dqKVki5lF4kuCTL4OsOR8FVEd9AA14BO+IFDBRgcd1GBy0?=
 =?us-ascii?Q?J3cg9gCUfJUBnacl02vgPtae+OCE+T5PnC26wFtge26iWwPDEHPxYDS/bBEh?=
 =?us-ascii?Q?CwX5iYud3ds8VITHqb9r8qPGM50C7hsGGdWoqq6aHgjwf/U8E3dzUWF2euYB?=
 =?us-ascii?Q?PuBzkI+FTJ2YddkkLz+hLriwGXC6OTZIOWlStuHwtUxovc3T3enYVmRYfkdZ?=
 =?us-ascii?Q?5xGKwiQ4i7yFkpeNC7PeaJ22ImQP3sNJuh6QTUzr1+mKnqDUCdpSlTCsd3l9?=
 =?us-ascii?Q?C08UBmDTBrc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fsRL51/1nEYPIyJWHbVCkXK6uqYcDI5xZE0laFVgJtF/QqFMYPGY88DVCpIP?=
 =?us-ascii?Q?VGRXlmKWPC1waevKFwQG6XH4R5HrKE8fVqk+8FF/wfthbMdPkq3p2ZblMnls?=
 =?us-ascii?Q?py1NOnIFSVcfzTUOBNrWtu/RekIhzY7QG48VBXa1/Q35lipk8Rgsy11SJk3J?=
 =?us-ascii?Q?NrJkNfb1hsHBLXsfgaCXKdofiJxvtBiVeoTZOKuGzo3F9UOYjU9zjHszhT6m?=
 =?us-ascii?Q?bKckO2qGVmcGn8ObSQnYihBqwRY8BM5XrxM/4asvH+kdbRRtNAnhigLE/fZM?=
 =?us-ascii?Q?vOxS3zUCIFNc4zgzCPiuyRNTzebLGp6/Ic8ei45TSUUuK5eRABxoTo5MT5C1?=
 =?us-ascii?Q?8TZgQCzIYQ+YN2DWKVj5ZLb//XnPdjrrhKTVIDdRbtEyCFNbFLlMDEjD+hA8?=
 =?us-ascii?Q?CqFmCF/gzqThhaByAO8nN2azQLxemC9dIlv4eUNmz32QTyMbZzbC6unNnna0?=
 =?us-ascii?Q?EjKH+NZSwBZQbZFsaDnwJeHVHF/sMK+nkggN4MUTPkNV9sr3vyFgRI/M+QfT?=
 =?us-ascii?Q?2HHRSNBgBPxCEtMOfz4w/fHjSdtOiTD987yzShAd7Zpn9ZOukQk1nhTODASQ?=
 =?us-ascii?Q?ll2FZXD7aqo+2NB7KgsjWtg4TGHvGFpCOQRYCp1nsUWcSL7mqaB7NLeJ1/yc?=
 =?us-ascii?Q?a5tyz+vlOWGoDuBabuFdqmuxblGsWMUTTfT83y2tc+2+9+4m5RVb0VqUYCLl?=
 =?us-ascii?Q?HZdg7kO+0eRDzXwxs2m9607PXAkuzBDq3kaZOLzkJM+rMtPRnQ7noI/LIUt5?=
 =?us-ascii?Q?PB9LkmWtM5Ng/aRGEa3ADN6Bg5SWivaX6Ytcs5xZj+kC/hWtkWORoPMEnADB?=
 =?us-ascii?Q?UnWrhzzGOtCvSr2gXG/rqSnOxH9DAlsVps+DpFOX7CCDg0V/ITLcn72fMtfC?=
 =?us-ascii?Q?KXoGzbRRc/L5xMWPjLtPXV9lcLCExWY76o9XjzzgCkGLuEnmX4IH54IWIUZ7?=
 =?us-ascii?Q?mJ62ffcqB6PAVXLGAlIPtUoDDBnY3r8P/lYD7MQLfTJQzbE/gFYYqBMI2Z+N?=
 =?us-ascii?Q?a2rAMNml+vgr8AI66qKz/4VCOwOpAX4AbgoalQ03GMnC/uJ/uWs0h5Dt0Py8?=
 =?us-ascii?Q?lPnJGl1hPfy3V6qPg7l5GtvHHjOVQCs0O4MYUb02vHsPgDm6vnzh5FBMLkO8?=
 =?us-ascii?Q?Wc4ZyC5xdx2X9+Q0do2lM/mlsHymrvx0TsbhJastY11CPe3+JjdJrWhsin3s?=
 =?us-ascii?Q?Sc0YmRBcCr/kv4ofE473RlSUbokdg0gSEvvb9DxpsA7ysktkzcaxXGvKTy6l?=
 =?us-ascii?Q?c1sqaPMGiQ6rQxHGK8LC0KsjXK2hLiot0lu5xfickI3CF51itnkUNjuXzxKM?=
 =?us-ascii?Q?RnRej3IYFVcG5arXiSPKIPxEsT8YTdqiolA+pY+ru11zEjdXGOVfcletpiBW?=
 =?us-ascii?Q?oRWt33+NxpIlBJGFWwEjZQnLUgqq0nDN9yq8TJgjLpCFxJWSo2GtV8ZP6QKC?=
 =?us-ascii?Q?Z2etftATn8J1r29MU3aTnWXFeEtJiMKnh3ugc0nY1Llo0dUWdo/7d27qTblN?=
 =?us-ascii?Q?Ll9mmKV70J9HkgQnXNy7bhsLiHu/EchOezfYATZ9yX0RTs/R1dL15ntN5tY6?=
 =?us-ascii?Q?qC1WcIOetXRpSF6zye0TxzTfF4tZSudWf+Slq2YrHAqxVWEzUDaPTOjcClo0?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QvYPkfKplrcUvHrRKOMCtkTEULQRqreekjivaILAjpteYCkftElicb/Fee4OuykOLbmbFysCBeRcNnArRYBpd8QKCb6UeqcnpJN/jEWAUE5uMhAWnqsZdd0UlyMKdZlgX/eVISEN2dQTPjZg56YDqTiTZvWqme0prWphPst/deNdO+v/Wfla6aLvBh/0ywfSNzvP2sRJsTrO1NLRr3h20NAeiPwQz397b7Bw7MhxXJccqRkOD1OsaKmGjiJ+PmLf1xwMS1XEX+o0n20oxFJB+hdM6i0Q7PTFZXTK50iT2py42owrqCs5dgBZZGvzOmBXc98vlnMWB3Klz8/xMiQ9fzPvoSwSADjEnCMIcRKuGLMdoYsKj7kP8w1q5bQl9ZWoccka5C0gGrfEpCNKo0Nq756TU6gmL35JGU+vPY9+/vlKUZ+pPS0d3mHN/nw2qvnS0CzVBoTw7SOeBje6CmfZ5gwIdOOtAz3tqBfFS7HJCkvyFado09Kjqvw9JB/9HWJ9WUVW7FVuTSOedM+lfWuqz1VFqib2IqsqE4bRp6aB3p0U9xRebb7HLbj1RKAGgJjNcLMWoTlYQdETus3btjWk3q95MA6RdF49lNapDTcDlKk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1249077b-8347-43d9-eddf-08ddc90dc95f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:52:00.7979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wUG8AET34B5tc0vUjJmZkt0lhfqgAgYmcnxFibR0QOGMdY7/X4odvcZ/o0N+19tkOpEX4rVV5e+EoIfv/rhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD947D3BA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220089
X-Authority-Analysis: v=2.4 cv=MNRgmNZl c=1 sm=1 tr=0 ts=687f6d54 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=WVVn9_fbma5nrTsLpRsA:9 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: 0Z9xrwwI-t1gvSqt4s6YAMTh8f03OyCL
X-Proofpoint-GUID: 0Z9xrwwI-t1gvSqt4s6YAMTh8f03OyCL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5MCBTYWx0ZWRfX/JaEKx2lsmfP
 17xrG/dAEXPHjVLRfI7eXOc//IDXCgI4H9Y/D74wNuH/lNgo0v9mM77QgvWGTMN986inTkblzJI
 e8oYvbubIybgEiVRSX5zXspr8zeTdbzpQnQzJ/I/WsXNUIL1DiWoTFmBi2NykARigvc5PP/vLmt
 IAhwHTYqd/gbcdgnkgc8UvOR+LOot80uzosHc86YS5x3Z8nAh6bV+FCXcAIGc3EYwvlLiLFABmc
 f1LbwBz72cbfwtY3r/NOU8JQwOBUX9qqoDZiNqGXe8g0T4OI6G3hUzUQxFeZ4fxt1EMhcvN0XCu
 PWlDoYHx0FA/J8wB6U4/jx+m36CkEOtEmw5glPD4qPh7rC0FUwrFZnc0B5ZBpmTJgNdX4/ENObj
 Kp8qQgcF33pzYB9LNpsDAa4HpJobgg1hvLXjGRvOAGmUv1+nJFMBsH7SC4RaTSkdcaKex19w

On 25 Jun 2025, eugene loh verbalised:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> DTrace has many version numbers -- e.g., for the release, packaging,
> and API.
>
> In reality, the variations in numbering have become nearly meaningless:

Tell me about it :(

> - Packaging numbers -- like the Version in the dtrace*spec RPM spec
>   file and the VERSION in GNUmakefile -- have basically been tracking
>   the DTrace release since 2.0 anyway.
>
> - Stability attributes for idents are haphazard.  Generally, they
>   are 1.0 (or sometimes other 1.x), and all the BPFs are 2.0.  While
>   this is generally accurate, it is not exactly robust, and idents
>   are sometimes introduced or modified without careful regard to
>   the version number.  Further, the stability of user D scripts is
>   likely to depend more on kernel variations -- e.g., the contents of
>   available_filter_functions -- than on D changes.
>
> - Version number updates are susceptible to mistakes, and so there
>   have been version mismatches.
>
> Bring the version numbers into sync for 2.0.3.  Clean up the descriptions
> in dt_version.h.

So... this means all the ident version numbers change to 2? I doubt it :)
but at least we *have* 2.0.[23] stability-related version numbers now.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo the tiny nit below.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  GNUmakefile                                  |  5 +-
>  dtrace.spec                                  |  1 +
>  libdtrace/dt_open.c                          |  4 ++
>  libdtrace/dt_version.h                       | 54 ++++++++++++--------
>  test/unittest/dtrace-util/tst.APIVersion.r   |  2 +-
>  test/unittest/dtrace-util/tst.APIVersion.r.p |  6 +++
>  test/unittest/options/tst.version.r          |  2 +-
>  test/unittest/options/tst.version.sh         |  4 +-
>  8 files changed, 52 insertions(+), 26 deletions(-)
>  create mode 100755 test/unittest/dtrace-util/tst.APIVersion.r.p
>
> diff --git a/GNUmakefile b/GNUmakefile
> index d1e18bb1b..00269785b 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -3,7 +3,7 @@
>  # Build files in subdirectories are included by this file.
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -14,7 +14,8 @@
>  SHELL = /bin/bash
>  
>  PROJECT := dtrace
> -VERSION := 2.0.1
> +# When updating version, see comments in dt_version.h.
> +VERSION := 2.0.3

Oh dear :( this one isn't invisible to users...

> diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> index 0f47ea70d..5cfcab69a 100644
> --- a/libdtrace/dt_version.h
> +++ b/libdtrace/dt_version.h
> @@ -37,32 +37,28 @@ extern "C" {
>   *
>   * These #defines are used in identifier tables to fill in the version fields
>   * associated with each identifier.  The DT_VERS_* macros declare the encoded
> - * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
> - * string that contains the latest version within it along with any suffixes
> - * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
> - * and then add the new version to the _dtrace_versions[] array declared in
> - * dt_open.c.
> + * integer values of all versions used so far.
>   *
> - * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> - * explanation of these DTrace features and their values.
> + * The major number should be incremented when a fundamental change has been
> + * made that would affect all consumers, and would reflect sweeping changes
> + * to DTrace or the D language.
> + *
> + * The minor number should be incremented when a change is introduced that
> + * could break scripts that had previously worked;  for example, adding a
> + * new built-in variable could break a script which was already using that
> + * identifier.
> + *
> + * The micro number should be changed when introducing functionality changes
> + * or major bug fixes that do not affect backward compatibility -- this is
> + * merely to make capabilities easily determined from the version number.
> + *
> + * Minor bugs do not require any modification to the version number.

Nice general rules! Now we just have to follow them :)

> + * When the version number is updated, the following must be kept in sync:
> + *
> + *   libdtrace/dt_version.h    DT_VERS_STRING, an ASCII string that contains
> + *                             the latest version within it along with any
> + *                             suffixes (e.g. Beta)
> + *
> + *   libdtrace/dt_open.c       _dtrace_versions[]
> + *
> + *   dtrace.spec               Version
> + *
> + *   libdtrace/Build           libdtrace_VERSION
> + *
> + *   GNUmakefile               VERSION

I don't think that's quite true -- in particular, libdtrace_VERSION
should only be bumped if it experiences incompatible API or ABI changes,
whether or not DTrace itself has seen e.g. major language changes (which
is why libdtrace_VERSION is not simply $(VERSION) already).

-- 
NULL && (void)
