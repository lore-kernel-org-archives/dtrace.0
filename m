Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44729B776
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 19:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754420737; cv=fail; b=P/yEKWPB7OrpStKnMQLeGqVmzJ4YZka1QrhIigdTEMtgLDxCf9DJWw4MnSPl/UZjk0EGfL0iSFPrdvtS5FujZohNgIsZfjRkDR0+1aBC3bGDNGuodo0vD+joGpvHHACHKNvxEKUTUpF31QK/n6UnYjH54dI1KPI2/HwBRXP2dtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754420737; c=relaxed/simple;
	bh=+Q2uZeUeuarCpNc8qrvqlkZO65vvICLrZuJV+2izcf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rtz/i0GEG+Z/kvtEVjtpeLnNcOL0y9NvRlpEPrpAU0atkagOmeBsfG+DdXdWYYZYDbqjUXuoGf/2fJCf2ok3ILxLktHzdt8ojs3nKVlG/RdL8S6jY37+qAgcU4HyoLvay51AUAdpMo3kOViMm6WGcE5ZTBusbUULEEaahElFIi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HDr0q7uT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x/9bk/eh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HDr0q7uT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x/9bk/eh"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575IuGmA027075
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 19:05:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=VLPFDWAZaQvA/z35y5
	vTXmBoUBTwBcQ5aJfV6ktL/ts=; b=HDr0q7uTVeC4q0sZP8Ep3bVHYGIdeSfOYx
	DDN94dNl2+0Isym15pZMg/fccTxRA8OmYA4pryAPT9zF82BqRID0UyrBYtMCjaQC
	EJcaCY+rb4FmdbJFkE61vK3tvdsEmsPeEMxkJbyG5ArCfhzYPBb1C9CPBTsL3cAD
	Iuzfgy2aS7qvvEnWijAquZu5UhDkFse41AwHnhBQuvr5i5q9mKw+SNkT3HUEdh99
	y47UrN+KXc460/VBk4H+o3yMJjn17bhpOsDHSOQsrkeu2Lgt3ga8LMG38Ulm1JWe
	lQGEBpJdyuYUe2jqjQ8SnVNQjvWlfCtfUzEL2dsF0Gx2/qjKouLg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvg040w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 19:05:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4DE0019899
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 19:05:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwq2a4f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 19:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S78nKPfvqDbiREcCdaTiUwBYCNj/0cQNqZrTnRi0rPABTOIp198c5xq3/qBIM1184OlgPJjQvVYIcB2Q0cmC26A80Ha+tRWiBcKrMgRfg23s7YAP/EETVOFFU9cqQqP6YLAU5Pl70NqbCTkm5idCd9OeUK6Lo+fJ3t9KXJuiz2PctL2nHILhIj7oKWh8V+lkrkSHkQXJPouilcfi/WqZHmfnFIo91fYc8zu/09gXAMXGfm3aI+D6DJCNyUXGCwxSGauiVUg6EjsDZ74PeZxaRSwgTuPJFe9nzw9IoeOqqCtJzUbqMHm9cngqWzoyFxqFfdBrcQhUWHdJG/ozceRKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLPFDWAZaQvA/z35y5vTXmBoUBTwBcQ5aJfV6ktL/ts=;
 b=fpvNqnzapvAXjtat5AeKDQDBLXjrUfbMksxTxSNmqYgdSSG3DzWA2tj716lOr53eWvyuYXCNwwIEzmj/K7Cmp+6mTAg4byHvwoRB9dt+loINxBAf9TikMhrXR3jHbMTqsOf3J2yoXqDC7GNwc6LV8YRcz5fepX4U8fU2ubpk/oyWMBWEaIAFbwsG6oCO5IQSUBEF6RfN/63WRNts+hHGasf2Nibh2ryn4CyR9UF3HZ0vF7gBBnAvrdD0hZ8H1jIPZObwJqHJgUFjaapd8IqC2O3kQ+iSHwLwwfrMTmwSBTYUbqrMqAjPSMDoo9IFCdaEg8EGsDcgL/MqgOKqYcMzww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLPFDWAZaQvA/z35y5vTXmBoUBTwBcQ5aJfV6ktL/ts=;
 b=x/9bk/ehIXBhRAQJhRnmNJfdX7V69FZ65VXotWkqag6XhTC3dznF7pvP3TdXld4CSoxXoAqRthR/jgDnVbIRswxZGBBt5vz+azFlc5uDJA8xV1gu/vJXX1LzlfZo4cVHoYaNcdj/xJF3ZrFZ+8VtajjisIRjb7KVcD/MUD7hZbA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SN7PR10MB6407.namprd10.prod.outlook.com (2603:10b6:806:269::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 19:05:31 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:05:31 +0000
Date: Tue, 5 Aug 2025 15:05:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v7 2/7] support stapsdt ELF-note-defined
 static probes
Message-ID: <aJJV+HZNnqOprcOK@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
 <20250730090148.2141954-3-alan.maguire@oracle.com>
 <aJJSUEWU0eLuHKEd@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJJSUEWU0eLuHKEd@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SN7PR10MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b108d23-0b19-42bc-c926-08ddd4530c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c+YEP/OvgK9yD0uoRt8rjH6NDzjZ7fFyq7ChO+zBSb50XuhkuqGMPHP9HO+9?=
 =?us-ascii?Q?bKTe+rXVGebqEa9ZsBBPSqTpPT+LT1nxxDDjpAagBzhTsUQfwHR1yStb/KhN?=
 =?us-ascii?Q?iRIERiGNtg3PR0D2KAGzr04szAMirk45bhJfzJFMH1ujYsmwb9SorTCtJygA?=
 =?us-ascii?Q?/taMAXqshub/EOYxpVKrnhJ+XnXt+V9ATeeq7o+gPP9INyOTIPdBvh0bjZ8B?=
 =?us-ascii?Q?gHiCC+m0wdYkHQO9CGDgvIQokB8qQ+MBM96J42BCnfdFXdwQHIYMVyNFDKqI?=
 =?us-ascii?Q?134Sc78Ab2HL2DqeFWXSR3QUaObIbl/+OuEhA0/buSj1D4YhpId9D/jh4GDM?=
 =?us-ascii?Q?oKxoIRBoCBFJfqAQ6aFUSlJT8REYURFefn0ly3DIGYlDiJDAscJpJfhsg4vG?=
 =?us-ascii?Q?HVIVyRiBWaxWHkkcAxaDNWKqq35nCJskVfju5ueG6aIzUAWYsoeAck26WPC4?=
 =?us-ascii?Q?VrVIVSy7G3pCJaIrRC4Hu3Y5REEFA1czwSc4t7opyKTMoMwsIdaFXFzf40Ju?=
 =?us-ascii?Q?me7hjKcYOTPTRjSo5XG6HMTojQby8LHb/xBCscXSPV0boSxp3Fp06X9HPEhM?=
 =?us-ascii?Q?kOHSKDCzaiN0WRe4ZYZz8yyyh3V5iwRlHegLGY7p/amWNYjOrfV4cYfaprRo?=
 =?us-ascii?Q?PkZjwP68Mfv3frmIq+UZhDrYRJ0gnEKnJ8fbzEqRW2BswM7d4n6y4jtZRT82?=
 =?us-ascii?Q?JwMn/yeADRhD0cp0z/sjKBSi2ntEVx+HjF35ZxJmca59yQJaCfJ5JtIJLKEv?=
 =?us-ascii?Q?/AMcbgfRc1cFxRH1mRsIW1UQVxGpDE7R2UiTv+dBhrvArcn0JjyT4fDcV38p?=
 =?us-ascii?Q?eKJcMaKOp8aTDmNpo73a6yKMMF/Qq+XTPBhPFUM9JDTOS41TEsjKypPBmy/B?=
 =?us-ascii?Q?bjzkqnSJiChwokBhlOTE/C7gSkdx22ywxSu5QYuwJ2tqKohUdTqDkq00//96?=
 =?us-ascii?Q?TUmxKx9/5AuB/i9JxWTSf9fgo/QHHzPJUHiHihG0pFnx3f/BidoHdbMBtCP1?=
 =?us-ascii?Q?sR5IVAxe/gCOnGUtrkRFPfNx1cNPsIcByqOdrhH8ZQjyYngkdDvTbIPMVmjQ?=
 =?us-ascii?Q?coGo1kWPxt15oVnJjEmdyMHZwU/dRGqaUy2NjsfPGMNv2HOEpLw2zVEQdrBi?=
 =?us-ascii?Q?X8Y1mnxgfiDrvHVBdPM/maEzjl6ZcAUpgrlUaCgYD8OTHpjDddRrGxTHuxJY?=
 =?us-ascii?Q?oXCgUk/m3Vftn/a8b950UtjmdE7IsMj70VRgXABsFHIja0Pxz/5c/6Q/ZRGe?=
 =?us-ascii?Q?F2VQRdwuQxYaCn76rpBIf7OmyskeFKxYkycnzYo2GwN5dvO8fSv3VBV1kAY/?=
 =?us-ascii?Q?857E0FVweG3I0kSq39Z9k2aqglgLfXuAyJGQ9txgP0v0SJarOMR1w7fv0j/D?=
 =?us-ascii?Q?iXzKpeYS4KirxCwRbExRQsZvQiriR8vzm6JvvyJUnWxsITKMrwAZRHHSGIvf?=
 =?us-ascii?Q?zFVtRjrSVHM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LYvRJV9ePyJo+1aA1Aq6k0hBEJfx1xYS3UKv77rXYLuZ23yHsD14Z3Gcm7sy?=
 =?us-ascii?Q?qibFxkUgHmoPQqo5SY2/TLRLk48QEEuA5ERNOCu/yUAr1jSk4w13M/R/hP7E?=
 =?us-ascii?Q?Cn7OiOtgoKwm6zwDDE3WYouqkiQH297IjxLWCnaUC0K/ByCmbDnVrOGDexmL?=
 =?us-ascii?Q?VXR+O5YoqF4057ZHmbzAM0IEzkIE7BE1QsHbBhr/h49GKxmabYUucZEmtuVs?=
 =?us-ascii?Q?PXHaIsvBxFei2WON6jxIMpDPkiCp+oqn6tQr/hSA/AugJRKUKDE4Syu1N3mW?=
 =?us-ascii?Q?B3FulQ/21lon4CD3d3+w2zPQL8TL/J/Yw+LBMqag3PxGk0ze54a1h3GvkyFh?=
 =?us-ascii?Q?MsuQ3ZHXWOSNRGSe+uSg4afJkbKs21xBgyunlSnjiulJJIVZc4VCky3WKEsy?=
 =?us-ascii?Q?zA7ME5CNNRQnDmS1pVJuyuCimQTkUusM3H8hCm4EiVWBByvUbm501olA8gYC?=
 =?us-ascii?Q?vzreLJcOyiwfjyiTwP3O6sEKAPBtY/TNf3Swf7OkQeoI1R8fdw/k++UUOgt3?=
 =?us-ascii?Q?7v3n8r8IixUu656Anfw4dlrXi6lIbT0IS3dfHHh0F1i7HocbICIpSdW50Y68?=
 =?us-ascii?Q?cSaH7TC+v3CqSJgr6nzYnBZRMqHVNsPP4UHgGOXjVenwklkdPJ1gBD/glaw4?=
 =?us-ascii?Q?MkrkoVPtny3Wf7f13EDyRBvwifHPOGW9c8yzzJVqntNZg/5mM2OeX5nDUQzX?=
 =?us-ascii?Q?+nYz3m2JGJbcIQeFEA3VPBhbZ3QfJp7hDw9aiJMMHil3YTUZZYC4m4QK/7YQ?=
 =?us-ascii?Q?yuKuOvf9KbUXGWAJ5CAqc7dyuszsN8r+zg4Di73yTeaHc8W06QOQ+i6cf/9r?=
 =?us-ascii?Q?tGte+x869eCd+iRYdtYbLFMErVQhkD2jAwOXvGuxyOUGHscbSnaH5TpVoLEA?=
 =?us-ascii?Q?7JEAOfC//LDNs1ZaQjPGAbdYDheNhqm9mXtQHsLGd19z0YYFBvgLr0uHubwq?=
 =?us-ascii?Q?E5uDg4AIQD5SskD9gkiXYgMPH1Rg97bku+YZHF0TecybqeKKIztMWdybWdO/?=
 =?us-ascii?Q?nvYOo0J0UOGTDzA3wloKlxfQZ0Ey4RIO/nkgb+WnuBeC2hYmNOYI6FCXiAna?=
 =?us-ascii?Q?Z0dNUUc9/mAnHqP82lff2SpPJM7qD4HIn0dhbORLOeeopn/eJoHrE4Y07VIh?=
 =?us-ascii?Q?6mA8WBLq+qFQoYRdFkfEnZ1DoLeG5rWQR+Ce3HETcdszjWMEFnE7pYU3CsZG?=
 =?us-ascii?Q?iNJCrunCgNgpP+kknxYYP1v9ZK/uxl/AlAvGKS5SWz3l1f8dXr7760RNJvnf?=
 =?us-ascii?Q?+mT71hFkP+dCxDjV+rtU1gTWlc5djIj8/UJNg1dhp/aXf02sB9aadf7QSDju?=
 =?us-ascii?Q?2142ZV/q6wwYQIwCiN3zt/kPWVWpj6zpJGpVYguivwU3PrspNPYKaDgE3jEV?=
 =?us-ascii?Q?WBPGkyzp7QSgYsx7/FOB+16iWjJixfo4ygh+aHcxVAR2vSV7yHyhQ/Vhpcke?=
 =?us-ascii?Q?Haj9kTUprldwilRUrBzqfUCiUjZWzECAW5DW//ixJ0BVGUcCKFENT0SGSvVm?=
 =?us-ascii?Q?iBxcKg+vy/9BCe+MuB54HKUZkndIQo4YcUDIc/17CtoVkNLTqqPhtermVqfM?=
 =?us-ascii?Q?rvBBPocuwplqG76vsdiaZrwjRYI34svWblE9K6X+9A56gW4HQbt9yssxHeO1?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PLPuZ0jczeX5Z+pp+q04sK82N3rKXyZtiDJ5nZLLcMqQyGYC1s9c5QsITpsZs2S6Hw6O+ReaiiVDkhuTbfLRsft36oj72vBXaFu+IVBFJOAP/7iP3kSYGfrjZe8bwhNZk8YPag4IhlWkqzeIOsJhl+64isVDtGP1fJK9NeeZ83Cb9ZyrDNULrW2JRA2ml+asN5851HzsmZDrlh8MruNIcufKiyLpiEbG1fiXZ6thp/7E+Fo25Z86A0p3/6zaG0dC6iQcLfTsu9xbGri/7Irjfq27yAYPrZaVDh6i+D5/+872ARXn4QFO8Lx67OITdtDUAIUuQE1ziuHO8qAkb3wHj0F4lHsBhqSEb93DWFIY/2NosHF7xJiXYw6FRlA61IfIxZLtX5iUm9SLa0l5M7L8tNgk9ge7V7ImqZJ1/wSXu7oDE5SgEJ//EfWsAmET6mr3M/2SOsu/gBTQ9R6X2aRu8R2oJh8Lb5h8oCzlbp72mkq6zjFNdN3f/PF5gUK39O12raL6irRb9UPl1jV32tRe++8VEfhLl0ZQ8i8EWvmfVFJxAbaAVjdNTVDwMlT8oeKdpjPFoUcj60VpBA7eAVMKa7d+nlMm5e/GNUEIPXKkM5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b108d23-0b19-42bc-c926-08ddd4530c5b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:05:31.2862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQO8ltgujoBLqqvHD2Jo1qSSHZgWIX7MO92v3lHlaAKlt+oi80FTCsH7UqQ6Pbzf2JTeERXVLiBjK/psxRr3LQJbC0NOFz0QGqAWtDjStNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050134
X-Proofpoint-ORIG-GUID: QlwVjJraEZ7YJVzWT9zs7KEseP43Jz11
X-Proofpoint-GUID: QlwVjJraEZ7YJVzWT9zs7KEseP43Jz11
X-Authority-Analysis: v=2.4 cv=QORoRhLL c=1 sm=1 tr=0 ts=689255ff b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=ewIvUW9WX-wB3hmmzzMA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12066
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzNCBTYWx0ZWRfX5WmQrynKpHPM
 byLFwI4d/etUAVqR6WgP6X7QKSKJvft47vVk8NnJ6SxeWuipxGmD33+b4lhzYmekMNYOm2mF9Ua
 TujvGX9AQ3FzVtPVUXPcTObriUIc6BGfTTxh2BfuG2xPxXcxwlN8b5KzZFzrPk+4G6UQ1CaLfmn
 GexYrTitYBenKIRdTR20s3wvzLL1doP2P6eZopFI7lDzbMa1V/UqMU482gnlncFcDTzvGFBn04X
 lMm/WXmOp6zP0xmEdOD6HvKQsKB2W3btdhZZPVNYU9+NYkoNBWz6YyaKY14//XxnirunVTZIV0m
 4aZsv6vJjcXknNNADZjNmzt606Qk1fRhOVqzpoUTz0C0qZIYi0EeMHbE2BxF6hl8rncAWyYVFK2
 BDaAu5l7bMvakMb6kZsTQL3cIyoDhG1XfKepx+Vejy6MAKqJeGIRFVsv0Ie5sGLbFwEPwPs1

On Tue, Aug 05, 2025 at 02:49:52PM -0400, Kris Van Hees wrote:
> Comments below.

I wrote too hastily... see below...
> 
> On Wed, Jul 30, 2025 at 10:01:43AM +0100, Alan Maguire via DTrace-devel wrote:
<< skip >>
> > +static int
> > +dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> > +{
> > +	const dt_provider_t *pvp;
> > +	dt_proc_t *dpr = NULL;
> > +	const char *pidstr;
> > +	char *path = NULL;
> > +	pid_t pid;
> > +
> > +	assert(pcb != NULL);
> > +
> > +	pidstr = &pdp->prv[strlen(pdp->prv)];
> > +
> > +	while (isdigit(*(pidstr - 1)))
> > +		pidstr--;
> > +	if (strlen(pidstr) == 0)
> > +		return 0;
> > +
> > +	asprintf(&path, "/proc/%s/maps", pidstr);
> 
> If this fails, asprintf() returns -1, and path is undefined.  So there should
> be a check to deal with that.

Actually, since path is only used in the code block near the end of the funtion
there is no point initializing path here, because that creates multiple places
where you would need to free it.  Just move the declaration of path and the
asprintf into the code block.
> 
> > +
> > +	pvp = dt_provider_lookup(dtp, "stapsdt");
> > +	assert(pvp != NULL);
> > +
> > +	pid = atoll(pidstr);
> > +	if (pid <= 0)
> > +		return 0;
> > +	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> > +			      DTRACE_PROC_SHORTLIVED) < 0) {
> > +		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> > +			     "failed to grab process %d",
> > +			     (int)pid);
> > +		return 1;
> > +	}
> > +	dpr = dt_proc_lookup(dtp, pid);
> > +	if (dpr) {

char *path = NULL;

if (asprintf(...) == -1)
  longjmp(pcb->pcb_jumpbuf, EDT_NOMEM);

> > +		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> > +						  pvp, dpr, path);

free(path)

> > +		dt_proc_release_unlock(dtp, pid);
> > +	}
> > +
> > +	return 0;
> > +}
