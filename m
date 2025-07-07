Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E113959D
	for <dtrace@lists.linux.dev>; Mon,  7 Jul 2025 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913867; cv=fail; b=kbMH4vrRJ7zWHn/S6oFz1idws5qLLRzAwMcsMDpUlBdptBUMDo4g+z6y4mwGFRrG8/NlDEPQkuewzaG/beeE251LPCQsf/8dj6hG1wlcyl+xGPoqaTZH7FAZneSNIe/0r6xYOcq63OO+zLyPGW5akdcSUoNAX9bssYwJiC+llA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913867; c=relaxed/simple;
	bh=IutZiUSIOXDx8gjHDlWFet/ANSWRdtuEQ37xdz5ZjfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uxUhCnePNBGHZZI+Py2dfYUMtakyYtFptKRO6fmajnTvCybMPLQriSJPvkKmzMau2Y1ZowCNM2IITaor+h7ozPHkrEMhX6UKf0z9MQhDCYTMEigI+HmRqGInYp+MITfZqvfU0bLnOi0Ze1iw7ztHzLizA/67EzFy5pwphmEhbnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bt0UfUC0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CruVeEar; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bt0UfUC0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CruVeEar"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567HqRLU005201
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 18:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Vg/jRlec25Gt2agDYr
	XMaoM54YopAr0M54w42fEVsxs=; b=bt0UfUC0szLCkDr/LVZrhZ/KbHrGdDxltJ
	voivYgrTknB57d47pTLnv8088919CkqsvozEFVGnF3cv2QyKPDIaNKSOFPI6qQHw
	KhXVm7Zq+Gj5hsUvt7veZjYCEs7vo3D98OnPgMPZXYXKe/w/IxPeXFl/2EHe4PgK
	HlHpEo8fOrdG+G2A+DrUFaa9D+mQjZm3W7WzrUpIqcO5OQ5w0o77Er3uFLjiKzGg
	EMwWE77ZjokfSJuJ14IvVrpCprnvIxI1+ygfjywczruurJyt9nqe2jrAyp8kA2RX
	z6rmFOW0mgG/X5lWY4dDS+3dEZJQEP9tP5iPCtnXqYjZ/CvY4aAw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rk0t832d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 18:44:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567HraCX027486
	for <dtrace@lists.linux.dev>; Mon, 7 Jul 2025 18:44:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg8kk9a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Jul 2025 18:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYse+MNVbdaq3teCSM2mBZM0LMJgMaVxyD7R8yfUJaLVF9xGO1pTnGotwN3p4G3tW2w4M8X9nwqaAU2j7eDP4B7g4QKLsttCwierBDZNpUfInivAgQJZVw8j41mHcMdQwzCngvNw+BEFnM6FBSwUzOGalWGdIs0PN7Ki+y2LPCASV8o1sW7OUNbaGUGMDBYT7dhKu+4+UCkZlDjsPBDgIm/Ns+X/o2jDXRixdQowfQCj3Pd/PGe39Ze8waY5WPY5p+iqU9qKjwpFczZEvLc4b1wnAEwilFdVbP4w/TDpqI0fvvlgjWqTcnWkbgY9Fi0hmw8dOupN4cWV4zXSqKM3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg/jRlec25Gt2agDYrXMaoM54YopAr0M54w42fEVsxs=;
 b=QwadaWoSUW7l12hgBToaQ5OB82edTtpI2x5aXus5iEcbeWd4+MTCYuWkjK0OquoN9oSDX5e8iqxfDcrGs/XI2v5LqKgEXjwlLdhgR/C8Lj6ZJkgOYB1RzXOji5bMd3D0ZHZItzfqOfsYAy0rH6nF2v126Bgl3RZXH4OfQwI286Ju6iJNxuw1RXQCxrUTPiJqGKSN1NxYZ3huayOzZStxx4YoagcSF85uX/VVMC5i8Pp7L+QsoTvzP4B1kn3n0BeCTqA9cuGE95TqDgjtP/Hqpylq+ygdBKHB8LnyeicPlYZXD5ji5HPzNCyf9afNN6O+oXH6w6OmU/X0iFCzpWU11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg/jRlec25Gt2agDYrXMaoM54YopAr0M54w42fEVsxs=;
 b=CruVeEarJZqyeoVkQGbgwSiFFFBL6PvQmqCdYFqWiyj5VYxTRRm9wW1+bT20ikYzf9qXC04HCWCYJOYFnuKrL+ABaBHx5aAx02/kJR+5q8EVwK+3RHQoSVEdWKDGHeInYF2pqE3V5x8Enh1NH+NA7LgXvkKZHHx3ktMgkLmLqyI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA4PR10MB8376.namprd10.prod.outlook.com (2603:10b6:208:55e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 18:44:10 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 7 Jul 2025
 18:44:09 +0000
Date: Mon, 7 Jul 2025 14:44:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Message-ID: <aGwVdpSb5b5pmqZK@oracle.com>
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610135813.15746-4-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA4PR10MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1e81b8-697c-4191-cb65-08ddbd864270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XgPelapaxJLtyjXogaZCYTz1+RBYsYy2I7CshnlK1X3IxGfV4o4hIIpGVVJ8?=
 =?us-ascii?Q?3xPsU109e/JJJH1lE3Wt8KdwHQLCO/WWXnbs6VQBnNzvf5cqn8yR6e2qmxXJ?=
 =?us-ascii?Q?PAMbSYDPPWh8R/uCpXYhPHLS2zQC2U0WXhs5SKDOAmiUqwALBeciAZdA0fjy?=
 =?us-ascii?Q?SpEf96aZoIgzAS5uByeBcone4nsuxEEEAkCRfjGAdvNNlvM8aRErUZ54sJyg?=
 =?us-ascii?Q?H9pXHR5+udlSXYF0dqkzycytqRFoBhFLhVkNmsl0g+qviwzh1XWcNTJZQEny?=
 =?us-ascii?Q?bQ956pYgEgTNJw05dRs8WIB2GtNqOcquWXG8CCr7XPvzxOtFUZqauCxh1D1F?=
 =?us-ascii?Q?z1xhu9KvQxDv9oLJkZWLJR10nHyyhOUrwDSbXgWET9GTU5gXbHFzHzUF1eRJ?=
 =?us-ascii?Q?7ucR14YzkQFe/2CNx4hsoxn4l4SZLf4wIEcHhqv869ay/xS+KV61b81CbIpI?=
 =?us-ascii?Q?YSwbsZ38bjQAlvWeprLKnmXv3e+2oiV55dJ4gfeeiXubCDfmxo3GvdObyXno?=
 =?us-ascii?Q?JeBEJ1igYKaG6YEvPjcaAa2nkEmm27g+j5F/I5yH9gYW1YMUKFg4QjwiYAA0?=
 =?us-ascii?Q?yH0ZOMtVHJx6oxuQorUdPp4sQpvxCU+u2zjqjpOV0djW5fkJnmB9OHCBsmOr?=
 =?us-ascii?Q?foF+PFb3zG7EmYLyfAWnSx2tcvr7pJ1UiJD4nxOLYZOfP5VOIkUOKbtP5VXB?=
 =?us-ascii?Q?0DZG2ulFX1gG9sqNBZAtEk5qd5UHXfV+6KqKn947rHPCbEP8kb3+yMkr5wHi?=
 =?us-ascii?Q?donkrUuSYE5xtCR4DpGHr97d/ulffbICF201+BCb/Mn+zOgq7SUe4hhFqYxA?=
 =?us-ascii?Q?lW1s4Ofq58OsDrqhs3B7QVo0KKLCwLwAJdORqUWeceF6i9Tgcqw31/JaNVpA?=
 =?us-ascii?Q?NToEix6XutGRrQcWXVK0tt5a1Nha2tzhv+2V2IEEmPEemfxXfGnuPj2c3EJ5?=
 =?us-ascii?Q?0JIsL8fEukcczaXZ83m+drms3AsmpOPNNi8DW8hs48zZK9+GZcwaAlZyK0ks?=
 =?us-ascii?Q?Gx4ezbpcHNwpqgZfX1eIvpJgettIBWen4dASfErsGKm0vRrzQpii1HWoWExy?=
 =?us-ascii?Q?3nJ6PhnBBYet9GbD7lxei9BSoKkM6wP+CBAhOh914eXZJBmDGIW1ctW46xgX?=
 =?us-ascii?Q?Ld/mGHhSWPy5RjuHG+gcYn/GHNKemtdFZrkjEe5aknvD6JfKmFTsjRA4zmvj?=
 =?us-ascii?Q?Q1ZXkQDXV1U7kuiFFnK9O1SXxM5JWDrrUxGZgFSnUryGypR/t95cNlcL7OHz?=
 =?us-ascii?Q?drtfANzlw/oXUFienvyxAq4d8fwaZcKF3OmMjU6RT+e12Oa2R1IopCkUT55f?=
 =?us-ascii?Q?8ZqF+jQYmfGxp/R2S0UbyiAE5/H8gKlpZY88rw80VghMK6AlXDIbFEc9q8M+?=
 =?us-ascii?Q?8i2tUFuCHZc7v5+mnGmW1fEUzAzHlLaBv1+8ixjw7j6qLKu1Zw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?diOHsfWAM9vXO9Lpux8chTukoHq36G4dAGAdj/yaFxkGK13qU0Ys4PmVUGWb?=
 =?us-ascii?Q?o0KoXjeXmRoeZdcucgB5u1D1hub1XkMRArXKo0sAfek+bwjPGUy0B8/u1/HQ?=
 =?us-ascii?Q?Jjm4j+GWrIBO8cdiE4BcdlhcM1AHrplq8eLbQL9ngKYxCvAp3AzFB9SbVad+?=
 =?us-ascii?Q?YDk6NvPoji6bLQ48iCkZKEAGx+VR45YeOnmDsKGqIfJYJrLaTzD88s866db9?=
 =?us-ascii?Q?XDFBglyQX73IwPSuj/oXOXqSvhTtwhxPdS4tds1EbJoZnC4OxgfCdb5ENubJ?=
 =?us-ascii?Q?XXdTvJCj5cEZJqwq0cZnsva0rEqCBzdnrg5SYTqURho9baZAPqDVJxJxKnS7?=
 =?us-ascii?Q?E/N2GabvkUuF1WEFERj8Srmw+4wqhoYO/lJ7Ts9hqfny8os+lm/wA/SEuedI?=
 =?us-ascii?Q?jnbWrV1OmPi0cA09XO3lmx17sxg0Fzi1gpW2HL/ohZIKoVikxb9UIiSHnbj6?=
 =?us-ascii?Q?/xCrqGxL5nCZ6StSLA8gibDrv3PJ03Wlscv8Ug3MdFQ8dJTTp6WmbFYpD36K?=
 =?us-ascii?Q?duDhOLpV1v3chusYbenT10SjixQMXOmiO8Y39LrPJV6xFmpTTVVF+ZVF8BWD?=
 =?us-ascii?Q?OhoMmpqtwdcU/dAC4Y1ugl8ShKjdT4Upg54Xlkt2q4lgQR7neNhcf0ZBgKGW?=
 =?us-ascii?Q?D/Ru9s0iGpEfYj4ujhBbW+iwa1+xaBWPJFBrl7sTrzILKCvmJnsgEcOSX+3q?=
 =?us-ascii?Q?fo2deA6gUciJ5XeYyYw48vGyiX4KeF19SJv6h3qDBTFLvv+uENxps7OVas09?=
 =?us-ascii?Q?eb+4Ma0HsURDWDFlz919ImVYZ1QTGs4GPYaPnBrxg/z0vskb7ItKSXN0Cass?=
 =?us-ascii?Q?yNfeKMIoBR1JyLWC/qZIwIZjWmHH/xjzWLmlcmXbCeQKJTlBj7ubbYpjpezh?=
 =?us-ascii?Q?kmGErPyZVJptf0UVCb+KXgbvEF4MAzda/gQtEEsZpj0bKETW3+e3BsIHNS1w?=
 =?us-ascii?Q?u7B4lHDWQxitwPt19h1ydZbXZBFw5mxgR86n1AZGONJv0ccJ3N0R4U8Dggdp?=
 =?us-ascii?Q?uHOQR/KlZda2buwRWyr00ScD+/aE6OxRtoUniudmppjY3v14U3BGXgJmZxEO?=
 =?us-ascii?Q?pzXMH9fUZsXwWE7ytAKwqDdCuQbgWZPJsklyxETSIlTetJBM/GFxDiLeshk+?=
 =?us-ascii?Q?Hyy0+gY4O6qOfgp7ONdeNWLAEfNvnNhTf98bJuQ+K2zP8R9CZrWwswRskzvR?=
 =?us-ascii?Q?PQAdYE0oJfJOz19Cesnxb8rL5WDS2w+zrEr4RaWKtmjnNWODuED1b31aTbif?=
 =?us-ascii?Q?MQwzVtbLvRiwO5fZvLcjzTJsZQiIxyAo3jBbH817sQhdIdB4zt9qfLb+HKEb?=
 =?us-ascii?Q?W/6/IfbHns4mm90uHOVhhbHOVzpPDh0nitvPGhOlG2QqKLnE85lwuKPOhWTu?=
 =?us-ascii?Q?sCqkgX9PHZYDIzqriqSEtz/+NeA/B7rDbY5J7ngjTFh1f1przbpJ83KfGDsu?=
 =?us-ascii?Q?qE6K9wm1ROBepO+pzBgT/xaao116snG6Y6powhd+F6KBIFLzygLjq1511qTD?=
 =?us-ascii?Q?OiY/PtrVEQQ5CPLWbMU5ldthFU8WBQYPb1KAeqXZZD4Sn38m2WmAKgQLby2Q?=
 =?us-ascii?Q?qOVJ+NERAxbq/EUluTfo1CNB68/x63dgEET9kpKVRPOp65MxIuwXmwcbO8ca?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZkPX6gMtEafHepwNI9JEiLRApfVoRsKu0xrhsetRXrdbY00AFl3YXdEf+YKqIJ0DIdO5k7NaNgZ5LW5ubcQjBbEG/fCumX7oWcoDKOY7lF/z7efjtajWfpROERQMEXjJsLTwBRHc85Hywans94+QfYf267nVzXXdltjxq1faDC0cNNGbIERtFnxSMK8PWe1Tsfpbj00fwTxtZPxng/cA+sRjvq1QLFQgWNlbIT1bdvfQm5J7T8CVHmA6tLw9R+EXRB0MzLHcA5KBmXZFD4E7jkkXr3SnDny3/d8+DO+Y+tvVWrUzXYHWor+SZOorwnZpC0PgJq0HXm63q6tBzO+qtE3yfXBw+rs7zHum7iDDXluQFQcw63G+Mxg/4tzCqXF+12pgXIU6D9zAgG19NjdOHf1KXrpHYcsFrx8p2LKScPRpYgWelBvwxyNvie9Jqzuh4y8XgeY8z0AviJiI1FqRkv5bU/DEzTeAuu1Z3JVKLiU3FZloGZ4NqVeW3rsvQgib0kzRbgLmTyvEXNjyKDPCporgzgDKIPRGG/PUAv69spfym833fglh+S5W4gvCyeIZuORR6XJHG9OJ7lI/78Ezk3/bNnBkTESXbLlsFsWQBAQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1e81b8-697c-4191-cb65-08ddbd864270
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 18:44:09.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdUyZbEBoEswSxMT46DXymB/9vuZD0Y2vKOyKZoDNre98M7LbU/LyZ+p48qoofMuW2NbL1rK1bPicefptnuGGr9hIEFBRvycUP1AwVClvcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8376
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=856 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070124
X-Proofpoint-ORIG-GUID: TKMD_zSgQA7SX9IVRR1qzO7oZGQolYsu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEyMiBTYWx0ZWRfX7bPnAT9wNmyY JNPxrNQzfS64qCxau9Uz4VOM6emBiyNLwC92zQ0BfK01lV9A63CKIoGzgydiwb5wEUtojUdujwK Db+PtzVJ3dIk+DfWwIK9a0mDkQYgJzBdUOnevj2QUMCMQfybGmktgskCyv5TTasOivyKllzf4J6
 ZzrEUqk2C6xvYF8XKsVVrShgRAl/M7/Nbvi0SsmwiMSBrtocf6UNCbGRLSQE/b3IdbOGugKH9y7 wM3sVfuO7NIfS7oM66O73YPtYWMELCteTcEoL2t5WepKBApmkjFTxgI69i1RKtQYRG1wnWuzXn7 7VycgVEQq8a0YyHcVjBMhHhrUNIDm/RrRr66Ps+IJKFEsItmIQh0kXUDXxVl9DOW9Y5LsRmBKNK
 r2SeyxsI+oz9cr0S0L88BEbAgihu4vPDNSXhqGkpro6d2O3s/xfH3HUDV27WqrHOMEShgg1h
X-Authority-Analysis: v=2.4 cv=VI7dn8PX c=1 sm=1 tr=0 ts=686c1589 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=Ej40h8rI8Aaw9mmgquIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12057
X-Proofpoint-GUID: TKMD_zSgQA7SX9IVRR1qzO7oZGQolYsu

A few other observations:

On Tue, Jun 10, 2025 at 02:58:12PM +0100, Alan Maguire wrote:
<<skip>>
> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
> index 54e310cb..d4beea87 100644
> --- a/libdtrace/tcp.d
> +++ b/libdtrace/tcp.d
> @@ -8,7 +8,6 @@
>  #pragma D depends_on module vmlinux
>  #pragma D depends_on library net.d
>  #pragma D depends_on provider ip
> -#pragma D depends_on provider tcp

Definitely should be put back (already mentioned earlier and replied to, so
will be fixed).

>  inline int TH_FIN =	0x01;
>  inline int TH_SYN =	0x02;
> @@ -60,7 +59,7 @@ typedef struct tcpinfo {
>  	uint32_t tcp_seq;		/* sequence number */
>  	uint32_t tcp_ack;		/* acknowledgment number */
>  	uint8_t tcp_offset;		/* data offset, in bytes */
> -	uint8_t tcp_flags;		/* flags */
> +	uint16_t tcp_flags;		/* flags */

Why is the type of tcp_flags being changed?  See the comment below where it
is being assigned.

>  	uint16_t tcp_window;		/* window size */
>  	uint16_t tcp_checksum;		/* checksum */
>  	uint16_t tcp_urgent;		/* urgent data pointer */
> @@ -111,13 +110,16 @@ translator tcpinfo_t < struct tcphdr *T > {
>  	tcp_seq = T ? ntohl(T->seq) : 0;
>  	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>  	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;

This clearly shows that it is meant to be uint8_t anyway?

>  	tcp_window = T ? ntohs(T->window) : 0;
>  	tcp_checksum = T ? ntohs(T->check) : 0;
>  	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>  	tcp_hdr = (uintptr_t)T;
>  };
>  
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);

This could do with a comment I think to explain what it is and how it will be
used?

>  /*
>   * In the main we simply translate from the "struct [tcp_]sock *" to
>   * a tcpsinfo_t *.  However there are a few exceptions:
> @@ -158,47 +160,45 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>              ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>  	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>  	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>  	    ntohs(((struct inet_sock *)T)->inet_sport) :
>  	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>  	    0;
>  	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>  	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>  	    arg4 != NULL ?
>  	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>  	    0;
>  	tcps_laddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>  	    "<unknown>";
>  	tcps_raddr =
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>  	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>  	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>  	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> -	    "<unknown>";
> -	tcps_state = arg6;
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
> +	    "<unknown";
> +	tcps_state = arg7 == NET_PROBE_STATE ? arg6 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>  	tcps_iss = T ?
>  	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>  	tcps_suna = T ? T->snd_una : 0;
> @@ -229,3 +229,9 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>  translator tcplsinfo_t < int I > {
>  	tcps_state = I;
>  };
> +
> +/* For tracepoint, the last state is in the sock state, next passed as arg6 */
> +#pragma D binding "1.6.3" translator
> +translator tcplsinfo_t < struct sock *S > {
> +	tcps_state = S ? S->__sk_common.skc_state : 0;
> +};
> -- 
> 2.39.3
> 
