Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79E61C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576230; cv=fail; b=QvGbNNCxVtI/vCtgvtG5+KizdQB0oFqS6d7ugNupTbCMfn79B0ug3xnBfUQsZz1W0exjaXS89BVkuEsenW+lET2RhY700mgPiGrOwjXPf3ND9TbkPGOk47M0guBpF6tRBzBcA85M9NIg0x89R4XHc12vXkbVux6YFsORg1kqBqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576230; c=relaxed/simple;
	bh=ZK32Ay99xaeeFtOyBgtFUfwt9NDex3GN6/gvlxTr9Z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RaecEWnDqf9pS4uQ2uhzqvqnDqE6CDFRus3S52ntaStKMRb6QIjO62eQ7SkG0tmwqO3NRnrExOTnbU2eTNpKbu5tc0p409xT2ynw5mu4aFyAcPA1pEzC34Rx+slIAjojLx73v9q/fQTtZw2qvvCCpBJL3DTSo0g0LFfpMY2r18E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bwemAZGh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Gmf6BMXT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bwemAZGh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Gmf6BMXT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fj33014211
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=YECkf+Nv2aA2gks
	3KDieV9OF+kixFsnMz5GLCE5yUR0=; b=bwemAZGheGVu4N+xrq7Ky01jfELTkCM
	RpIk3nKu9J9pXVTz3zWYFYwwVcR05qFu1VXnvV3DmX6TmsRs1WhMXKfa6x3qAVsp
	7TUfrsBybQDPPCZGOpXBTK0ninKdfo5TQnd6rCesl3aD1jfkTSfHsKFItPdngnE8
	9dCdnAcf0j8TvvAmOwTUxCc30QMm/1XEHtNc51IJlqf0ARDijG14lSkLBOaWVwDk
	RentxeoFMNtpDD90crTMCKNxAwjelY1ZPKByjZxstIWVywXH82WNqrcpfZBtgd5V
	EsOq7T6n2M9sUBGGCwvKTd8HxMLkyBlT562dMkWO/P55RXrEsTJ3ZjA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8gdmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:23:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47248gUv040197
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:23:46 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm86v2np-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLSaUoxmaydkz+bzvEf8oexII9mQ3eiVEM5rSg4/jYmJvDOvOu0oKp9cmudfkHmWo3N8SkScF91nK9J0JANxApWj9x9Zfdqx18PxMMizczEnXpbKtulw4P9nBm2pTRSkSF4if61Cx8lFCvfNrHBclYnROe5aMFs0c/dSbdXcd8E8zE004SP+sD0QVVWdA5T/1X3bOHu8rSe8pjMBE5y0UWpIM6nvujqS+EOt0qXvMj7DGOgaLfNFAXw5GH/kFg1rtFBhXiNIt8LMfMAcUS0E6yUbe0eR5KxWJ8aR/9fVn9TAYU9VrE/5JclSeXnjA4tnsg9mYHoM5F+wmbkCBGVEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YECkf+Nv2aA2gks3KDieV9OF+kixFsnMz5GLCE5yUR0=;
 b=cP+8t8WdtKplSick6e8xPBOhtVs9N/xvYHWg7Pk2uxLJpo4WiHYD981MppzhfNdA7Jx2zhfZVv4n9IIhSITDE5Phlp1FvZgxwfw34S6la1X6QcCqQNNuOog4oa7N6dGnLFrQTlpkyzGxP79KvxxFuonc4k5cyNUJKhGTx7EhQjxIQz9/x3gsutxW2InAyYZ9Ij2Y8BGFH5W1Q8jCsQt+puAXNwATMW43Wa1xQffDr7sA2ZmGFspCgY9Ebs3ebmNFEolR6bkv/wGK1XhCS0tjqUdHuuwJE0Wm129Ri5O1+kGUpZIqYZpoyxqQXLseZmMnk/a/Na1tLe+hu4/uysbzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YECkf+Nv2aA2gks3KDieV9OF+kixFsnMz5GLCE5yUR0=;
 b=Gmf6BMXTPT7j1X3aVleZozm7AnA6hiLmQ7Nxas4vjC7nykx0jTeCtNjhLvIsLmDviWk5Ee2KRGsBWst1L/KbfrUXEuehVWzZwGz25N3zlT9LseofS1KJj4VdapLdajRf/2Fv5W6d0FrTnmFp/s2W0XJzGTkx0m2pIG9ROxQUYyA=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB5562.namprd10.prod.outlook.com (2603:10b6:510:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 05:23:44 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:23:44 +0000
Date: Fri, 2 Aug 2024 01:23:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 1/9] spec: install sdt*.h in
 /usr/lib64/dtrace/include/sys
Message-ID: <ZqxtWn7e2uEhEKog@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-2-nick.alcock@oracle.com>
X-ClientProxiedBy: LO4P123CA0668.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::14) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cffb81d-c065-47d3-ec48-08dcb2b346fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1HhzTXT6MIcM9A7D6cHObluCa479EtUfRYQ8Q8ynNfX7ereDFeRfgZ92QA6+?=
 =?us-ascii?Q?uPMv/Q+H0n01DPy7qCcHihCKX65WN53CrwElcwup9D8yRaMdj1mDdDFRAjh3?=
 =?us-ascii?Q?88uZWHphuDkm1xv1VMY9IZ1oJ+CemnNRCFzbDPR77L3nd9Zdtc99VzHFkQE8?=
 =?us-ascii?Q?fVSqj40t84txfW4gvueel8xXv9YN8aSBXBzJwYTQB66sOdTz5bAAK//3xKDh?=
 =?us-ascii?Q?EFWvZ8UuIAM3/aVqcfLfKhMETpl7ObnY8rxD7CBK2FXb+h5GR+U9xEDkqL3k?=
 =?us-ascii?Q?n+/INtx7D057PjOI4lGTqnVsprlX7gKPgl68EYQYWuxHNj6vxD4X9MVvGMzV?=
 =?us-ascii?Q?6cN5cKShf6Lr99EureZ1/WhbQTiSvmLI1WosNNJUjSDYQ4Gq5znIPJ4tNCkN?=
 =?us-ascii?Q?/ktLrZnytgbnp0oJw90Tqq7do8nMmtr45V4dp8zssHrMyq3cvB6sZb+LaZFE?=
 =?us-ascii?Q?mbG+QVklD/3oL1Li793PnYlIfz7pC1gybd+6Gy8ZBZ1RvdYZYWiX/z5zwiOP?=
 =?us-ascii?Q?bXnd0X/Ec588tOEApy/+GS5Vzs2MXNdZYoRFMvdvI4wczOEbZ/emlDmHlwW/?=
 =?us-ascii?Q?XOfaT4jFLKWcncXlXLa4EZ/O7CycQjV5epsWLCYhjlZWyu9L4pC1hwRV9O7V?=
 =?us-ascii?Q?dGwNUlsn8w1dcEOupqy24taG2YVu4d97y4rSceDEt7DEds5umeEFPg05fRKl?=
 =?us-ascii?Q?agAly8iekfkDye9V6yu0lR0ucDaRQ0gx6ufeVqYNPVBMyJxGKUCH02YDjKJn?=
 =?us-ascii?Q?UEOX97nWiP01fFWWUuAcjOUXjoRqqkw4YP0/1eY2kvGRklO57jNKVvxxd1h0?=
 =?us-ascii?Q?fi2RcbJFZLGiXRw9Opvj58sN2S2xWESwAzm+iVpNTUlvlm08A+vgNz8pmH1/?=
 =?us-ascii?Q?X5KW27rGzMBjuOeqN/CL6R7SoruuErOcETX4p7m8kfLDAORE37yRzl/ToxOk?=
 =?us-ascii?Q?3rlGDy/KrT/IFvyljxygZbmrrtrAzqEwkhZRMPrG/UjEHK7XORjMJyi9bzgX?=
 =?us-ascii?Q?loW56sSx6bVcWMu1kG+cO0oEB8/E81j7JnDYTcHr1Fq2c8iMmTQRVBfH0LX9?=
 =?us-ascii?Q?LavG7bc1gAmDg4uJLQfq0tgplcyeIKi+CImfEHkbMyffgieUMXiLC0MbvqVy?=
 =?us-ascii?Q?QkK2XzLNwMoKdWCVOKApxOlcvONzx0nF9CD79H85x/Ek1/+MOiZpl1MHhgNW?=
 =?us-ascii?Q?H87cvA2067EYCa84lzrZFsS2d2Cm+dOKkiNN5Vy0FhI9KFNCDU9r8rFul2F7?=
 =?us-ascii?Q?T4UAwEdhMwcvS/Ov/U4vUEKiWS87fZ1vFLQx/BL/Iqkz/gMBgZWUWVpz1kVV?=
 =?us-ascii?Q?ZQlq9o/TApcmoTZpwUVsBagGTKI9KG7xLK9LeCEk+0uvlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xbS1UGMzkpYUJ6CxQWqxle/4O/k91czxvrcIKaxA4PR665+ByVpVnhAbeAoA?=
 =?us-ascii?Q?PWj8wDekI5OQuXG9o6O5vl2B/RW1w6WHF4YBk3mUMSSLi08ywTXem+Vv4+YF?=
 =?us-ascii?Q?yAjBDqLtydWg3WyMN6rvscG7moiZ9dz4WCjWYgWu89/tP9LvGur9KgDINfLA?=
 =?us-ascii?Q?4dqPGjhAjY6/g3kJ875a/B6BhjGd4Mc+/bFB/ko4zX3YDM/nSIk8ywTr1BqM?=
 =?us-ascii?Q?WqTmEpzIkJUia8+Z5GdlJbNwzr9honMK2Iy+uk8I52g0AX4ZyanmN/ztElMZ?=
 =?us-ascii?Q?em3h/k0moyzLrjH8ueoNs+bDYz9ATfEk4VZ6wuHmV8bCjuUnnNEb9wAXyb4K?=
 =?us-ascii?Q?YhFCEuR6WoqQFB1cTprS+lLct72c0I6dKqRD5PhCxoWvV+CvqV6wENuwJvLc?=
 =?us-ascii?Q?DWyl5l1G3kxErZbzVDW3dzQ0ZjNBbsFrCq1PVktRCzvs+QDZzU/ogzGuIu/B?=
 =?us-ascii?Q?UBhybG13AWgpZBxz293+coRcUcigiDcyNYCIn8eD8n1mI3wap5PzleioRmVQ?=
 =?us-ascii?Q?SwQS3bsX4uIQ2gEoCeKFBRWbMnlBXXpKd+R3HkNmflveK9ruf0q1cqxuZO42?=
 =?us-ascii?Q?TYYLWKQT13LpNipd3z4go4FU8/9Dl3Vh2SXULU5TrsX3b8R/ehvQZgxtXFmg?=
 =?us-ascii?Q?W+bS3IkXXnFvuvWj4s6zOFvDuGJs2+jUFm6qJl0kGaa8BjwiCkwnKLLVA+yk?=
 =?us-ascii?Q?VCPcEp8Fcz59EexBAP3DRidbLKU428HkTEZXWo4aZo29pY1pLO6OSN3bT5Ln?=
 =?us-ascii?Q?FsVNPnGNOAhQEYNJLfVvV+APbOoNSAHpqmNMecmj9ITSOSk5pJsIPXa2elnc?=
 =?us-ascii?Q?u0Q7lR+dkW/p/vIeRSdT0SoRH77VrelSCXSQKeqBWuDaZFCNDj7LQd/tlaLk?=
 =?us-ascii?Q?meKsb8h2/XIO09/Fhpj7QvyAH+3v5GS4na2Zjii19NesEp2TEhxHyHCvOJEI?=
 =?us-ascii?Q?EFPhkYVE8PpHUbWU3/b3qw3b31R4lqip4wWWZ8K65BPBJoNbwQw4rZ5EabHb?=
 =?us-ascii?Q?5xcMA6K//AfxOPv8qYI+slqC7SarcKRGYPIpjKZJbOhfuOlPQ1ytlV53piX9?=
 =?us-ascii?Q?7OvQj8Dkb+9HtsDIZel+DBdZ95lR7yPqi7uw4JjGAn59ptbZ8CAMsE4vMHgN?=
 =?us-ascii?Q?+gRq0w9xMCkyi5lP07ZEVW5wMbBMfTJJ0YFiFDSbRW8g1si+rPlOFmB/sIgs?=
 =?us-ascii?Q?li8eeK3PG5mTFjNRUFqrq0w/j20t3h7JKnk3CMXPMpCKOeDyT6kjs8Wme2m8?=
 =?us-ascii?Q?NrRZzcj1TWsxxlMTOy2vQtLBMlQuYzA2yFvHcIVzt9nsknUaViTYQ26GQmJU?=
 =?us-ascii?Q?/hIUZJ1V0y8KW0i5gBgzu2Tbx0EyujYAUnHWk+Ukztj0Yjsg1QJiv4HvAgmK?=
 =?us-ascii?Q?E76PtdaTTKLwuV1vMM1v4KVfU0IAlM+DdN4weaT34BeEUplFdrveO13BcOeK?=
 =?us-ascii?Q?A8UyQu6jLvWusaRQrYUrW3Wv5CPiDUmUnAIj6Uhj1+zbS0lF/adXlLMnk583?=
 =?us-ascii?Q?OBdL5DJPiVYg8lEQOkArbJcyG3QImi73+iRYgzTyVi58yGoVa8z4TVR9pfpQ?=
 =?us-ascii?Q?ksjyi7td7yQ3JR6VCnyd0tema7h7lyg4z/XPGISHaj9eiSw8jQpPlv1niRv4?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3rELWoJApRtbYgrdJcDFd2835N5aV3zSK7ETOixrRTS5KuVFbdVRHdp8luRnF0Rz07jQWJE/u6pYWgdNx7i4NlB29R1HI7bvMG+n6tmTX0+Uy+i2bWg+LV0UTMegjesZcND8iKabnBNIcoa7wCu3zW/nYmmgfXr98RZTtObkTWRBguv2zcpuiko2HAZFg2I5bsgGDKgg1DZFALvgTqYGkH+yYu08Ib9sSO0/JEqtcp8/xCBcWAqmf+BdC4+DYtMwqfmr9yBPaYEmzwm/5J+fkmZrPSkrNHp0+NwUL+B2i8n87DT++0uF4CpF7xf4gstwsllBvs2L7ip0d6uaXKEz+qGgomAYPJ2QP6v2Pg+MyEMSCO0X4OmFEFYEOYElv/onyHt5h0W5zD0S5SkJHlsuOXr3+GPpb8OuWoO31MDKN/jNXon1vZ1NMnri0p8NHflf9+LwNxhph7BohTFJLd+HD/Wt/2EneCC3C/RajQxS8uX8J37g9nggRWUjlazQ0DNcS6k8rszY0+GBdq7NGlv7R+WuuYVjCvXu4TZsbxS2YoMKe7Jv7aMeZ41uMs6Wuag0c2gb5WctSFRcbqSql3poditFrZHClcz3y1H1x1AkuEM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cffb81d-c065-47d3-ec48-08dcb2b346fd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:23:44.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SnMg9a0rT4MzvSynbnbiXaSB7zAO0npNnaIeiyIcyRC0LKxR876tnWod6Vdwmah2MvZkv/GV2SSfwGwgGzJ+CjkltIGVOqh6608F6y6zPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020035
X-Proofpoint-ORIG-GUID: idyiyALomA_tirKetsDJA4nw8IrernRt
X-Proofpoint-GUID: idyiyALomA_tirKetsDJA4nw8IrernRt

On Thu, Aug 01, 2024 at 02:21:48PM +0100, Nick Alcock wrote:
> This is the specfile part of the sdt.h move, rendered more
> complex by the need to clean up the mess left behind by the
> old sdt.h renaming.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtrace.spec | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 42ea9bc33958..28eeaa478376 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -86,8 +86,6 @@ BuildRequires: binutils-devel >= 2.30-58.0.8
>  Requires:     libdtrace-ctf >= 1.1.0
>  BuildRequires: libdtrace-ctf-devel >= 1.1.0
>  %endif
> -Conflicts:    systemtap-sdt-devel
> -Provides:     systemtap-sdt-devel
>  Summary:      DTrace user interface.
>  Version:      2.0.1
>  Release:      0%{?dist}
> @@ -194,11 +192,6 @@ make DESTDIR=$RPM_BUILD_ROOT VERSION=%{version} \
>  sed -i '/^ProtectSystem=/d; /^ProtectControlGroups=/d; /^RuntimeDirectory/d;' $RPM_BUILD_ROOT/usr/lib/systemd/system/dtprobed.service
>  %endif
>  
> -# Because systemtap creates a sdt.h header file we have to rename
> -# ours and then shift theirs out of the way.
> -mv $RPM_BUILD_ROOT/usr/include/sys/sdt.h \
> -   $RPM_BUILD_ROOT/usr/include/sys/sdt-dtrace.h
> -
>  %clean
>  [ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"
>  rm -rf $RPM_BUILD_DIR/%{name}-%{version}
> @@ -222,13 +215,14 @@ if [ $1 -ge 2 ] ; then
>      %systemd_postun_with_restart dtprobed.service
>  fi
>  
> -# if sdt-systemtap.h doesn't exist then we can move the existing dtrace sdt.h
> +# Clean up the mess left behind by previous installations' overwriting
> +# of systemtap's sdt.h: if an sdt-systemtap.h exists and is a regular
> +# file, move it back to sdt.h.  (RPM itself will identify and delete
> +# all the other debris.)
> +
>  SYSINCDIR=/usr/include/sys
> -if [ -e $SYSINCDIR/sdt.h -a ! -e $SYSINCDIR/sdt-systemtap.h ]; then
> -    mv $SYSINCDIR/sdt.h $SYSINCDIR/sdt-systemtap.h
> -    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
> -elif [ ! -e $SYSINCDIR/sdt.h ]; then
> -    ln -s $SYSINCDIR/sdt-dtrace.h $SYSINCDIR/sdt.h
> +if [ -f $SYSINCDIR/sdt-systemtap.h ]; then
> +    mv -f $SYSINCDIR/sdt-systemtap.h $SYSINCDIR/sdt.h
>  fi
>  
>  %preun
> @@ -253,8 +247,6 @@ systemctl start dtprobed || :
>  %{_sbindir}/dtrace
>  %{_sbindir}/dtprobed
>  %{_mandir}/man8/dtrace.8.gz
> -%{_includedir}/sys/sdt-dtrace.h
> -%{_includedir}/sys/sdt_internal.h
>  %doc %{_docdir}/dtrace-%{version}/*
>  %{_unitdir}/dtprobed.service
>  %{_unitdir}/dtrace-usdt.target
> -- 
> 2.46.0.277.ge12b8151ed
