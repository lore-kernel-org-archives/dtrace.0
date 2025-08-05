Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCC915ECCC
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754419804; cv=fail; b=BRoZzasp4qiMyZRSa5ErccZNcccUykeDtbpNpBnSIjSCR1+oTwim8VuiLYIifN0/EHs0ccl9R3ibcFk57jsKyKo1rgJbSncA0q0hKEXBeQhxfXgRDiDM8axpdLFFx2Er1GBNUg1VKr9fCs/yLNStbVHNcphBuI7LuufzLDq0U/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754419804; c=relaxed/simple;
	bh=P9rCG8o9zw+GnksKBDcMj3vBZuDEBcxlfIFIb6+ijNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tnOlEXTHDJ8TUNN2s1V8eHnH8zYH+W9XGreXvNoXVuwdKCMbpW/79lLHm/OnB7VROatbw9JSztTailOO2SDy7acBLMnlwsSiv9MyQF0XELzBwDFjOHTcTYm+Rt4hklVGjm1xbYSqNMbAkDl+girtaPTJ/5CsoGYyNjflnA6Tk38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JdQBdIby; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UuWB2i6R; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JdQBdIby";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UuWB2i6R"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575Ig6BB026074
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4j7Gq7MBALkbx98K1n
	vJfTJqp95QrhLTrN5/XkRDuCg=; b=JdQBdIbykoNODLsgoEkrRzD9Xu8ciZY/+g
	qMGt3rmlqZciTmCvqIQaOozU5T8wjjUKJz4mpUc8WaKMxrv4+sHk+umRHitrlhW/
	webQW05o1ClyzQ1LLAQR0UzB8+Xml3/IUGAageXPEiDXTEh3kfka0/5vTgwLQeXd
	E2B6Kbs4z9wRI1XFYqOdIJARuJJ8M17oHMq5C2uwi8j59KnHELzk7O/4x8FKy0lA
	ZEZiCrsAINUl291krLcnFfWso5CykK1xSYUzUfFcrGSzAUrcu+xlLn2DTSPKNlXI
	/xvvO2PYPVntNN0Zn7529llm0ZJZvkVVV0o2qWKIs0AT4DMjMUfg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpve02s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:50:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4A9P008872
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:49:59 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013004.outbound.protection.outlook.com [40.107.201.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwm1kdx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxINRt/qjXCHYR3RIfSEjSQFz+RZH19vqavVNc/D6J6GFUa97fNaR+Rrh5HgVM35OWpWn6BeKu28MbPBfCUSKyNVGza5DCX7RKP49vRaKpUfi588KHfQOL+WSKf55GoGNW94/rU+j7hMxNW6xTGP+PStTRXgGs/dQJUcpxa/cMm1XX3Ry5CjfnYcYZtjZZF3TKFtW1WFxmRWeWZF7r1qawEUHidc0sf1YYg/emqjxJd4I9/Td1Yd9Tk3muxrRStdXo3jF/9r+omzA7poMRm8RAcZIzuH2mWk3biqPaumnAsXrRnivbm/1ijJ2Z37T9WzvyeC9z9RIH39Rb3lSK9AAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j7Gq7MBALkbx98K1nvJfTJqp95QrhLTrN5/XkRDuCg=;
 b=lUCvWU6kVj60p4hBp1ux4O8rdLEpowSoRkmoJpVGX6LpqOliCOuOwYDIKaXoM5u9JN6UtqE3kv84TMSnFownM/jQwxlrZqH4ebTdhR0tsqkIhZYtwXavUpigOKCaTTaSFqzKqffTn2UXWdmW3S7cjxPM49eLSJbKepboMdXfdZjH6Np2xKHlAXoS6uxSsle11GgaCbphe33JCGWy310B/WM5XxuU9V1CK+KatNMUToW2+TinYIXLZ3fGK1kXWRIRNHYK7XBolrqx4quwb0q7VPPmeV4iol/uToXJrgibuoXEMp/XdgfBnBKwr8TTIAGkB56kMxQvVwuMNjf+H6c5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j7Gq7MBALkbx98K1nvJfTJqp95QrhLTrN5/XkRDuCg=;
 b=UuWB2i6R7kJmo2Ckhc8Ypx2WWbD68joPbsDgXtW0lP98eUIJz8RG4W0Hl9ju6iqi2xEjIGY+gCdrb8g2xH9ock2L5YI5LSvLnrdrhRFkIsyrjYxVclcrpNUAzkafHnYKolGN5HWjE79/TIerhXTlA3c1/U0kj50Ubu7x2xoJPZs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by MN0PR10MB5936.namprd10.prod.outlook.com (2603:10b6:208:3cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 18:49:56 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 18:49:55 +0000
Date: Tue, 5 Aug 2025 14:49:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v7 2/7] support stapsdt ELF-note-defined
 static probes
Message-ID: <aJJSUEWU0eLuHKEd@oracle.com>
References: <20250730090148.2141954-1-alan.maguire@oracle.com>
 <20250730090148.2141954-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730090148.2141954-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|MN0PR10MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 4157b061-541c-44e2-b6f0-08ddd450dec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PVKYxiVHU+Bn6a6PDL2LELGSlVDS6SmLIsjI6pZ8ekNO+eLWIB4fr/Hin73/?=
 =?us-ascii?Q?KiGs5tljGS6iPVbJP1yl3xECTmbZovCKohB2S91LTnlnfKhrD4edENweF4pJ?=
 =?us-ascii?Q?IzxbP4pJgN4QZ6Ek1m9Nc4CaiGmG0RGBxTR2wh0sQD8PxPi5jIkLR+fe7OU1?=
 =?us-ascii?Q?4VaIPRpuudC/d2XEMst6js3QLZvGq30XS3swV/jaeEARoTPYg5TAcrRWXaBS?=
 =?us-ascii?Q?tcGCcvMyrg+WdA2JIPRPECoyDRycwmD8mBJYPSGQlckObwksRV3RtxWW2v1X?=
 =?us-ascii?Q?dijTUsw5JW2Pnyu3MzyzUtvm+538EvQ0H8AazeiOb97nn/tw3bYlU0yubeHn?=
 =?us-ascii?Q?/nq/o6EiNmxjA273lcC9BbI4nP/BdtCS7LqCM9gkfzmkR3LTAjfs6sO9WwJc?=
 =?us-ascii?Q?iVUNcvEym9Ya8etHZyvGX/qEik3krfzkJWJ6ZFA2iMgQxJtnL9QikU7wMd67?=
 =?us-ascii?Q?QtiW2RnpDs+mFgD6kUf4aA5SfwXAW1xP/PpoQ1s90gFZk8AgWKA6cXNGhOK2?=
 =?us-ascii?Q?42b5RDS0YYeqyk+GBvo4pn+ME3e2UDmnac+vBzLllHx6lelc9j93vPrGyMQC?=
 =?us-ascii?Q?GkWLje0piZmVKF/QhUsVlJOS2kvla2d1tRevkmOW5/Wnj+UBtdadwIT+C1kt?=
 =?us-ascii?Q?xAMVv2Za4iKOuixJfVcmsl+GTnUq5AG/oynIF4eORNugiF90Fo2YDFOZ3wRY?=
 =?us-ascii?Q?beZrwEmlitZekvd0l7XF5m/Ep6DQcqxtMw0bLT9J0jFW27uCGHIdA/WV3sho?=
 =?us-ascii?Q?3AKNa7c+Gpt54OykJ4NJsHx8c8VUzTbfMvfyyo9pIbWFZ07czEzUz8ZmZvYH?=
 =?us-ascii?Q?Gk89po+mgKdLzGgCUC1RO2TpX8BqYtYDXdrwFsEkcjoXmPme5RWAxDPIy/7p?=
 =?us-ascii?Q?2q6vX2bvOgEvkhkn+OSGofRy/sqbQhWwUJwYnFdEtmssnPaGbemo4APvBVqc?=
 =?us-ascii?Q?LaAsDolR4hpYypa19oKnR4X01NfAFaCZeT5lQbbg6X3aL7PBwi5wsSzb0060?=
 =?us-ascii?Q?MbmkpjvaxY3DPXjDHkl7lhsPe7pmMcrjXyxObKbnu9rXcG9azt086aXYH74n?=
 =?us-ascii?Q?EPQYPL8sgf/rCKsnzB+6o+0jO/whKjCApDRcuolaohw5CgYklI31k5KrICNs?=
 =?us-ascii?Q?GdiZSEAcmmMzhrXd4dphLYNVKngTWk8rFURpxahO0UI2MHhjPyackOXFnYeo?=
 =?us-ascii?Q?Q2q5INnVFhPnHbcvPBM8cFg1M2QuaOLuc5+eZjQgq2Zz1RdVp+Euefsu0krx?=
 =?us-ascii?Q?X4KG+6Da5J53p0OiB0czG6FZT8B9Jb0gOsNjecXBLvXlLAevBbWoOecWGBe2?=
 =?us-ascii?Q?y1ScJPx1+LOhZ1lkNsvoQ7/Sxw7rTggitWoAsdRmCN04pYvVeQGdhQ/WreN1?=
 =?us-ascii?Q?9RBgl5qXN8avGV4a9uz1F/ym/FQINgAkjjnIjsaGq9XBemOIGAhmX3mt+m85?=
 =?us-ascii?Q?9/ZeakxNalY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IfdLWHWgyuCB/HpKWuiFrk7JYc+TChO4rhj4nYNVUUkNTLZv75+6AsQ3hg3V?=
 =?us-ascii?Q?wLsVnRM1sNr2lSO4fgVawAO0mT7XVRHWrj1nW38jEpPEnumZtMJOU9svXCX5?=
 =?us-ascii?Q?gQ9bXwBiCd9orxcZHCtyC/mmV316LM1pW/QN90fODZdHEyZrGQ6k+Br/Ntqt?=
 =?us-ascii?Q?TJmC9QHuGi8IaZT57hLX5mqzyugSOvIkhdCvQMMZpw8T3airAOFqbHZoSinj?=
 =?us-ascii?Q?1e3R8L5wSzM4Xc+Tv0HuXlzi6RAL/9oiG7DGITYnQAc/gzrBHQd2bIW2QwtT?=
 =?us-ascii?Q?XhSSbh7J9LPLZD2HjlUZ0w4IaEzvJKgBrmOoPxsLGQp4Rnp7UwIJ4NfSLpFn?=
 =?us-ascii?Q?C6VTapdxj/eS2tF05zj/eEUehYFsriQuUofj2I87KXzHZi0KqYl+59tslQ9E?=
 =?us-ascii?Q?VDO78q2vKWd6Ji+gy/3vKtilIwyTHh+5Zugp44jXBGN09ffKQooHCPI7GCcO?=
 =?us-ascii?Q?UHo1y1cYCXDzlXhVTdIpfuRtlKb30wW14+RWW9+IoHTXKINeOirW44halpM+?=
 =?us-ascii?Q?T5tfJyZPK/tjO45IMQdzGrbBj9TVCL+F7gTzFXPTzS5qrnt1NYelZkYmPV1G?=
 =?us-ascii?Q?XqAx5nAS+3XR/J5megGh1fKImFzxlae5zg+NKz/R03PHj4ujNA/7aneK4RUG?=
 =?us-ascii?Q?4kbCgMEtuEI6tR6VcZ1Ye0aOQbcGddwiIbDhESdFx+2FM0s2vStDaFUOo2E/?=
 =?us-ascii?Q?ko4s3ZpENyw97o8NtSC4qNYIL5Rdx89MrjtURq1gcU83I+4DvEgHEAU6jAd6?=
 =?us-ascii?Q?PcEugGf8i+VHaAytUzl2BENmDlyby0MU3GMnl3/kapfSEBz2bpxCUzw/qUoV?=
 =?us-ascii?Q?Iz+JH9KttKOwCjrfYrjYZPLg5GOB0GUr2sTNQxp9eliv4dXAnIaEr3BfKpl7?=
 =?us-ascii?Q?fcTUyQtszNcI1IZZQKhdSITbtHiEp9rfNLVj0NE0Gf74YnxK48VB58g7z9IB?=
 =?us-ascii?Q?19HEceqZKRir+9Qlh1h541KlYSeDNW8mD3QQVkb36QjKYC+RB2pEeC5HjQlf?=
 =?us-ascii?Q?9iB7EheOLZ7h0DxryTd44SfZ8q5zFusBYIbBuovUFV8sB4LlBzt5JE8vmWWH?=
 =?us-ascii?Q?StLskBq1ip0ARbamCbO0EssRW/0t2RtOutNDZoJ3yiAn1ouFq+lfty8AXsZj?=
 =?us-ascii?Q?5a/NeO1tj0FsuvMxRR5TnlI+tPTMorWZ7z9sdxOb99TizawlpOUmztB2V3TP?=
 =?us-ascii?Q?HkBOuikmkv/P01mjMkt7W1IP2tyc7IOts78t3cZLHaC7PkETDOH48UbtPiwi?=
 =?us-ascii?Q?eYlUmNV/skYCbpEu4l+rrECrI8t8fZ7vOlSPJzlspOni5TCgXIRq8psqZOs6?=
 =?us-ascii?Q?CnU96RvSgLBOd/Ra9h4W6mNuOIkiJULlUbtHqQjtiIUOID21tnAR1Mj5kLPB?=
 =?us-ascii?Q?4GCkj9z2M5UlNsbP6zHsVcbWq2IgU93dbS8t1Jmw9CPlqg1sIAEPLltc+vc+?=
 =?us-ascii?Q?ifGW7mYdH6j20etbPTf7o4GhjgTPKDngKCIn74R6e3b4xiRyJwKGEFZGzaSM?=
 =?us-ascii?Q?dZx9TEfgZrbZFM3L0ahXVKBmKSWTkkFdijhWrVwQuIqfCEuTkl0Ba5hva7Iz?=
 =?us-ascii?Q?mZIGp1AoJ+v9d79ytmYbVYCp8+vss34UXjgq+SdhaUfwsI+w8XHkw1AtZp21?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mi6z/gHniMsRdKBYs+uE7IrJY92Z/lGxp0UgwdfoGb2ft7jUXb7W9BCZ1FQmX0wRNEG9WxuDm4P/z36/uCL5eqOpnGnYacJVUUyRbc/QQYZHiWXPXvMXOK0emByS6soJenwZcoSjGyszQXaRNXy09+7vjYaT9R5/+Fec5ozH+n2Fi0ifzjp1rqCOMhFNlxx9A9YMBEzhOW8Q3muU5D10qGyhsyhJPkYtye7wQril9Qd7TRR1aONe2Xacog9g/cgxdDUvahxrNdKT/uURDcGWS+4b9Gr+O7Z9MxVXsVOP6nBgt5RX+ZcNDK2z92XpzPQ6hiUJtG80JTZ/5h9z5PFWVyPeHaBVtWUxX/DA7tMzVy4eBPmeoAgcDbfwlST6auxWA+qYED4ktUEWW9am8ykp/eSbVDPmZLQmH12iZcRPRuUHrBo3KfhIaKKAhvsX77UuluBAt0zmBkWGzndF4AB3OZjYg4wr81QS7Z7GT1ToooQ2kPu2IU5H/qdWeDdn7xspDqQDqUx1b703gHSsQKN3oftfaTlH95C/TqvgooDmjRf9r55MUdtzxtIm05B+jtFo4+X0gMipcWbDD1GSV7e33x3RCuJz1MZb98pSBNBedrc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4157b061-541c-44e2-b6f0-08ddd450dec7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:49:55.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD4poV5HPWE1L0Bi9woEpTHSi3vK8g5apmlZBOyau/ihDrMdZmy3B99HWEh1TD3FB3fXC02A8A72uWBL1J/tM7GF0C88P8KP5lHSho+phNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5936
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMiBTYWx0ZWRfX4DhAA/5nooPC
 6dNuslJR3v3/ilnqVq9ozfbp6OZZhs2nOSZpPXP22NzP1Z+cPr4ZIMfrolNw31lw+D8riYtb9oP
 HQByFn1qJ9K4FCpP3o4qz3AcEpbkUPuRX7+Bsk6UNWRMv7AR8uPHwila4W5yxqvHukWEchZt+dC
 E0OXUMflWl8nnVsNYSHAeIbbZ4bSFlT5GVVj9HjND7ay9uZHxVlH3qaw775VuTbvbVkVaO5t2co
 NBllxMjdg16o+YfKrG9aajZlgFXkKO/+bGYSI43bcYkCJgUJi63zQDeWOESlpXCLnCdNrdMPNy/
 lVs4fbb4mo3D0KWZNO3mI1ALoyx4DefbQvYbl9p/7q9bI8Cjhci2SDht3opWruv+uFsAs2LhXnf
 4W8VLwaYSVWPEaHgu311e4XMd2esWf5/jBioNA5KmDMWDOGGDRlKw/VA4OhlAgXmpDgdhW3D
X-Authority-Analysis: v=2.4 cv=ApPu3P9P c=1 sm=1 tr=0 ts=68925258 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=Nv0xFZPjfP_m5jDpCwwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 0Q5O1j2ZgSx8erdsXhuGy8jb4aGBl60c
X-Proofpoint-GUID: 0Q5O1j2ZgSx8erdsXhuGy8jb4aGBl60c

Comments below.

On Wed, Jul 30, 2025 at 10:01:43AM +0100, Alan Maguire via DTrace-devel wrote:
> As well as using dtrace -G to generate USDT probes, programs and
> libraries may have added static probes via stapsdt ELF notes.
> 
> Read ELF notes from binaries from /proc/ maps associated with processes
> and parse them to retrieve uprobe address and argument-related info
> to create the associated uprobe.
> 
> Probe arguments can be either constants, register values or dereferences
> or dereferences from register values (plus offset), identical to the
> updated USDT ELF note handling.
> 
> A new provider - stapsdt - implements this support, as stapsdt probes do
> not dynamically register themselves with DTrace.  This makes them less
> powerful than DTrace-based USDT probes, but they do exist in programs and
> libraries so should be supported.
> 
> As well as supporting ELF-note stapsdt defined probes in programs and
> libraries, this patch supports dynamically-created probes that
> are created via libstapsdt [1].  libstapsdt allows dynamic languages
> like python to declare and fire probes by dynamically creating
> a memfd-based shared library containing ELF notes for the probes.
> With these changes we can also trace these probes.  This is very
> useful since libstapsdt has python, NodeJS, go and luaJIT bindings.
> 
> [1] https://github.com/linux-usdt/libstapsdt
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  include/dtrace/pid.h       |   2 +
>  libdtrace/dt_pid.c         | 291 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c |  63 ++++++--
>  3 files changed, 346 insertions(+), 10 deletions(-)
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 8d4b6432..8ddb1167 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -24,6 +24,7 @@ typedef enum pid_probetype {
>  	DTPPT_OFFSETS,
>  	DTPPT_ABSOFFSETS,
>  	DTPPT_USDT,
> +	DTPPT_STAPSDT,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
>  
> @@ -37,6 +38,7 @@ typedef struct pid_probespec {
>  	ino_t pps_inum;				/* object inode */
>  	char *pps_fn;				/* object full filename */
>  	uint64_t pps_off;			/* probe offset (in object) */
> +	uint64_t pps_refcntr_off;		/* probe ref counter offset */
>  	int pps_nargc;				/* number of native args */
>  	int pps_xargc;				/* number of xlated and mapped args */
>  	char *pps_nargv;			/* array of native args */
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index d12b7919..42f667fe 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -38,6 +38,9 @@
>  #include <dt_pid.h>
>  #include <dt_string.h>
>  
> +#define SEC_STAPSDT_NOTE	".note.stapsdt"
> +#define NAME_STAPSDT_NOTE	"stapsdt"
> +
>  /*
>   * Information on a PID probe.
>   */
> @@ -1262,6 +1265,291 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>  	return err;
>  }
>  
> +static int
> +dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> +		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
> +		 unsigned long addr_start)
> +{
> +	size_t shstrndx, noff, doff, off, n;
> +	const prmap_t *pmp = NULL;
> +	char *mapfile = NULL;
> +	Elf_Scn *scn = NULL;
> +	Elf *elf = NULL;
> +	GElf_Shdr shdr;
> +	GElf_Ehdr ehdr;
> +	GElf_Nhdr nhdr;
> +	Elf_Data *data;
> +	int i, err = 0;
> +	int fd = -1;
> +	char *mod;
> +
> +	fd = open(path, O_RDONLY);
> +	if (fd < 0) {
> +		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +			     "Cannot open %s: %s\n",
> +			     path, strerror(errno));
> +		return -1;
> +	}
> +	mod = strrchr(path, '/');
> +	if (mod)
> +		mod++;
> +	else
> +		mod = path;
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
> +
> +	if (elf_kind(elf) != ELF_K_ELF)
> +		return -1;
> +	elf_getshdrstrndx(elf, &shstrndx);
> +
> +	if (gelf_getehdr(elf, &ehdr)) {
> +		switch (ehdr.e_type) {
> +		case ET_EXEC:
> +			/* binary does not require base addr adjustment */
> +			addr_start = 0;
> +			break;
> +		case ET_DYN:
> +			break;
> +		default:
> +			dt_dprintf("unexpected ELF hdr type 0x%x for '%s'\n",
> +				   ehdr.e_type, path);
> +			err = -1;
> +			goto out;
> +		}
> +	}
> +
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		char *secname;
> +
> +		assert(gelf_getshdr(scn, &shdr) != NULL);
> +
> +		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
> +		if (strcmp(secname, SEC_STAPSDT_NOTE) == 0 &&
> +		    shdr.sh_type == SHT_NOTE)
> +			break;
> +	}
> +	/* No ELF notes, just bail. */
> +	if (scn == NULL)
> +		goto out;
> +	data = elf_getdata(scn, 0);
> +	for (off = 0;
> +	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
> +		char prvname[DTRACE_PROVNAMELEN];
> +		char prbname[DTRACE_NAMELEN];
> +		pid_probespec_t psp = {0};
> +		char *prv, *prb;
> +		const char *fun;
> +		char *dbuf = (char *)data->d_buf;
> +		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
> +		GElf_Sym sym;
> +
> +		if (strncmp(dbuf + noff, NAME_STAPSDT_NOTE, nhdr.n_namesz) != 0)
> +			continue;
> +		prv = dbuf + doff + (3*sizeof(long));
> +		/* ensure prv/prb is null-terminated */
> +		if (strlen(prv) >= nhdr.n_descsz)
> +			continue;
> +		strncpy(prvname, prv, sizeof(prvname));
> +		(void) strhyphenate(prvname);
> +		prb = prv + strlen(prv) + 1;
> +		if (strlen(prb) >= nhdr.n_descsz)
> +			continue;
> +		strncpy(prbname, prb, DTRACE_NAMELEN);
> +		(void) strhyphenate(prbname);
> +
> +		if (strncmp(pdp->prv, prvname, strlen(prvname)) != 0)
> +			continue;
> +		/* skip unmatched, non-wildcarded probes */
> +		if (strcmp(pdp->prb, "*") != 0 &&
> +		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
> +			continue;
> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> +			psp.pps_sargv = prb + strlen(prb) + 1;
> +
> +		psp.pps_type = DTPPT_STAPSDT;
> +		psp.pps_prv = prvname;
> +		psp.pps_mod = mod;
> +		psp.pps_prb = prbname;
> +		if (elf_getphdrnum(elf, &n))
> +			continue;
> +
> +		for (i = 0; i < n; i++) {
> +			GElf_Phdr phdr;
> +
> +			if (!gelf_getphdr(elf, i, &phdr))
> +				break;
> +			if (addrs[0] >= phdr.p_vaddr &&
> +			    addrs[0] < phdr.p_vaddr + phdr.p_memsz) {
> +				psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
> +			}
> +			if (!addrs[2])
> +				continue;
> +			if (addrs[2] >= phdr.p_vaddr &&
> +			    addrs[2] < phdr.p_vaddr + phdr.p_memsz)
> +				psp.pps_refcntr_off = addrs[2] - phdr.p_vaddr + phdr.p_offset;
> +		}
> +
> +		if (!psp.pps_off)
> +			continue;
> +		psp.pps_nameoff = 0;
> +
> +		if (!pmp)
> +			pmp = Paddr_to_map(dpr->dpr_proc, addr_start + addrs[0]);
> +		if (!pmp) {
> +			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
> +				   Pgetpid(dpr->dpr_proc), psp.pps_off);
> +			continue;
> +		}
> +		if (!mapfile)
> +			mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
> +
> +		if (!mapfile) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "Cannot get name of mapping containing probe %s for pid %d\n",
> +				     psp.pps_prb, dpr->dpr_pid);
> +			err = -1;
> +			break;
> +		}
> +		psp.pps_fn = mapfile;
> +		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addr_start + addrs[0],
> +				       &fun, &sym) == 0)
> +			psp.pps_fun = (char *)fun;
> +		else
> +			psp.pps_fun = "";
> +		psp.pps_dev = pmp->pr_dev;
> +		psp.pps_inum = pmp->pr_inum;
> +		psp.pps_pid = dpr->dpr_pid;
> +		psp.pps_nameoff = 0;
> +
> +		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "failed to instantiate probe %s for pid %d: %s",
> +				     psp.pps_prb, psp.pps_pid,
> +			dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +			err = -1;
> +		}
> +		if (err == -1)
> +			break;
> +	}
> +
> +out:
> +	free(mapfile);
> +	elf_end(elf);
> +	close(fd);
> +	return err;
> +}
> +
> +static void
> +dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
> +				  dt_pcb_t *pcb, const dt_provider_t *pvp,
> +				  dt_proc_t *dpr, const char *proc_map)
> +{
> +	char line[1024];
> +	FILE *fp = NULL;
> +	pid_t pid;
> +
> +	assert(dpr != NULL);
> +
> +	pid = dpr->dpr_pid;
> +	fp = fopen(proc_map, "r");
> +	if (!fp)
> +		return;
> +
> +	while (fgets(line, sizeof(line) - 1, fp) != NULL) {
> +		long addr_start, addr_end, file_offset;
> +		long dev_major, dev_minor;
> +		unsigned long inode;
> +		char name[PATH_MAX + 1];
> +		char path[PATH_MAX + 1];
> +		char perm[5];
> +		int ret;
> +
> +		ret = sscanf(line,
> +			     "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
> +			     &addr_start, &addr_end, perm, &file_offset,
> +			     &dev_major, &dev_minor, &inode, name);
> +		if (ret != 8 || !strchr(perm, 'x') || strchr(name, '[') != NULL)
> +			continue;
> +
> +		/* libstapsdt uses an memfd-based library to dynamically create
> +		 * stapsdt notes for dynamic languages like python; we need
> +		 * the associated /proc/<pid>/fds/ fd to read these notes.
> +		 */
> +		if (strncmp(name, "/memfd:", strlen("/memfd:")) == 0) {
> +			DIR *d;
> +			struct dirent *dirent;
> +			char *deleted;
> +
> +			deleted = strstr(name, " (deleted)");
> +			if (deleted)
> +				*deleted = '\0';
> +			snprintf(path, sizeof(path), "/proc/%d/fd", pid);
> +			d = opendir(path);
> +			if (d == NULL)
> +				continue;
> +			while ((dirent = readdir(d)) != NULL) {
> +				struct stat s;
> +
> +				snprintf(path, sizeof(path), "/proc/%d/fd/%s",
> +					 pid, dirent->d_name);
> +				if (stat(path, &s) != 0 || s.st_ino != inode)
> +					continue;
> +				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
> +						     path, addr_start - file_offset) != 0)
> +					break;
> +			}
> +		} else {
> +			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
> +					     addr_start - file_offset) != 0)
> +				break;
> +		}
> +	}
> +	fclose(fp);
> +}
> +
> +static int
> +dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +{
> +	const dt_provider_t *pvp;
> +	dt_proc_t *dpr = NULL;
> +	const char *pidstr;
> +	char *path = NULL;
> +	pid_t pid;
> +
> +	assert(pcb != NULL);
> +
> +	pidstr = &pdp->prv[strlen(pdp->prv)];
> +
> +	while (isdigit(*(pidstr - 1)))
> +		pidstr--;
> +	if (strlen(pidstr) == 0)
> +		return 0;
> +
> +	asprintf(&path, "/proc/%s/maps", pidstr);

If this fails, asprintf() returns -1, and path is undefined.  So there should
be a check to deal with that.

> +
> +	pvp = dt_provider_lookup(dtp, "stapsdt");
> +	assert(pvp != NULL);
> +
> +	pid = atoll(pidstr);
> +	if (pid <= 0)
> +		return 0;
> +	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> +			      DTRACE_PROC_SHORTLIVED) < 0) {
> +		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> +			     "failed to grab process %d",
> +			     (int)pid);
> +		return 1;
> +	}
> +	dpr = dt_proc_lookup(dtp, pid);
> +	if (dpr) {
> +		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> +						  pvp, dpr, path);
> +		dt_proc_release_unlock(dtp, pid);
> +	}
> +
> +	return 0;
> +}
> +
>  int
>  dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
>  {
> @@ -1319,6 +1607,9 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  	free(globpat);
>  	globfree(&globbuf);
>  
> +	if (err == 0)
> +		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
> +
>  	/* If no errors, report success. */
>  	if (err == 0)
>  		return 0;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index b974e94b..7f12534a 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -283,6 +283,7 @@ typedef struct dt_uprobe {
>  	char		*fn;		/* object full file name */
>  	char		*func;		/* function */
>  	uint64_t	off;
> +	uint64_t	refcntr_off;	/* optional reference counter offset */
>  	int		flags;
>  	tp_probe_t	*tp;
>  	int		argc;		/* number of args */
> @@ -313,12 +314,15 @@ static const dtrace_pattr_t	pattr = {
>  
>  dt_provimpl_t	dt_pid;
>  dt_provimpl_t	dt_usdt;
> +dt_provimpl_t	dt_stapsdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> +			       NULL) == NULL ||
> +	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
>  			       NULL) == NULL)
>  		return -1;			/* errno already set */
>  
> @@ -477,8 +481,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  
>  		prp_next = dt_list_next(prp);
>  
> -		/* Make sure it is an overlying USDT probe. */
> -		if (prp->prov->impl != &dt_usdt)
> +		/* Make sure it is an overlying USDT, stapsdt probe. */
> +		if (prp->prov->impl != &dt_usdt && prp->prov->impl != &dt_stapsdt)
>  			continue;
>  
>  		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> @@ -645,6 +649,7 @@ fail:
>  	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
>  }
>  
> +/* shared between usdt, stapsdt probes */
>  static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	char				probnam[DTRACE_FULLNAMELEN], *p;
> @@ -898,6 +903,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_OFFSETS:
>  	case DTPPT_ABSOFFSETS:
>  	case DTPPT_USDT:
> +	case DTPPT_STAPSDT:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
>  		break;
>  	default:
> @@ -912,7 +918,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.prb = prb;
>  
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> -		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
> +		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
>  	uprp = dt_probe_lookup(dtp, &pd);
>  	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
> @@ -930,6 +936,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		upp->dev = psp->pps_dev;
>  		upp->inum = psp->pps_inum;
>  		upp->off = psp->pps_off;
> +		upp->refcntr_off = psp->pps_refcntr_off;
>  		upp->fn = strdup(psp->pps_fn);
>  		upp->func = NULL;
>  		upp->tp = dt_tp_alloc(dtp);
> @@ -959,8 +966,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	if (psp->pps_type != DTPPT_RETURN) {
>  		if (upp->func == NULL)
>  			upp->func = strdup(psp->pps_fun);
> -		else
> -			assert(strcmp(upp->func, psp->pps_fun) == 0);
>  	}
>  
>  	switch (psp->pps_type) {
> @@ -1116,11 +1121,24 @@ static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  	return provide_probe(dtp, psp, psp->pps_prb, &dt_usdt, PP_IS_FUNCALL);
>  }
>  
> +static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
> +{
> +	if (psp->pps_type != DTPPT_STAPSDT &&
> +	    psp->pps_type != DTPPT_IS_ENABLED) {
> +		dt_dprintf("pid: unknown stapsdt probe type %i\n", psp->pps_type);
> +		return -1;
> +	}
> +
> +	return provide_probe(dtp, psp, psp->pps_prb, &dt_stapsdt, PP_IS_FUNCALL);
> +}
> +
> +
>  static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  {
>  	const list_probe_t	*pup;
>  
> -	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt);
> +	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt ||
> +	       prp->prov->impl == &dt_stapsdt);
>  
>  	/*
>  	 * We need to enable the underlying probes (if not enabled yet).
> @@ -1152,6 +1170,11 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	enable(dtp, prp, 1);
>  }
>  
> +static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	enable(dtp, prp, 1);
> +}
> +
>  /*
>   * Generate code that populates, counts the probe arguments.
>   */
> @@ -1660,17 +1683,25 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>   * Create a uprobe for a given dev/ino, mapping filename, and address: the
>   * uprobe may be a uretprobe.  Return the probe's name as
>   * a new dynamically-allocated string, or NULL on error.
> + *
> + * An optional refcntr_off - used by stapsdt probes to identify semaphore
> + * address - can also be supplied.
>   */
>  static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> -			   uint64_t addr, int flags)
> +			   uint64_t addr, uint64_t refcntr_off, int flags)
>  {
>  	int	fd = -1;
>  	int	rc = -1;
>  	char	*name;
>  	char	*spec;
>  
> -	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
> -		return NULL;
> +	if (refcntr_off) {
> +		if (asprintf(&spec, "%s:0x%lx(0x%lx)", mapping_fn, addr, refcntr_off) < 0)
> +			return NULL;
> +	} else {
> +		if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
> +			return NULL;
> +	}
>  
>  	name = uprobe_name(dev, ino, addr, flags);
>  	if (!name)
> @@ -1709,7 +1740,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  	assert(upp->fn != NULL);
>  
>  	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> -			    upp->flags);
> +			    upp->refcntr_off, upp->flags);
>  
>  	/*
>  	 * If the uprobe creation failed, it is possible it already
> @@ -1883,3 +1914,15 @@ dt_provimpl_t	dt_usdt = {
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
>  };
> +
> +/*
> + * Used for stapsdt probes.
> + */
> +dt_provimpl_t	dt_stapsdt = {
> +	.name		= "stapsdt",
> +	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.provide_probe	= &provide_stapsdt_probe,
> +	.enable		= &enable_stapsdt,
> +	.probe_destroy	= &probe_destroy,
> +	.add_probe	= &add_probe_usdt,
> +};
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
