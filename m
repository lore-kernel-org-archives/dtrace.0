Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5F01C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466787; cv=fail; b=bb6B3RuwArgmwjz2ZedT+/FhDXSTiiPbGGliIGZt/hRTXmoPIXV8GAF1jhjhruhV1QaQaMO2/2fGdTSHQQwMJjx2stf190KqUKNOOYC8O7zeKHxc8EAsXlm5ljVRPJvkwSt+F81cEOwf7uQiCE5/hjR9ph3iP1rUjdp1yxFb/8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466787; c=relaxed/simple;
	bh=Eaqo2gX8RU4STmJq9Kkn+A+MWvDS0mhIGWw1ITdoHjo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/J6GwBTwAM+lv+/4/ahABMkfpvmPqIs/KqhYbHCJXpMzy9i7a26lrIp3qzm4JnniPWcr1mY2JNnB86gqTmqZtdF9XS3wSALxxvG4hidU1JPT6JyRHIw50KWcAkTXaDXMZo5Q2TVQLLiLqDtpljwiUHfNZDA5IURchNvumfWS/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D6XrMZFs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FY+nGa53; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D6XrMZFs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FY+nGa53"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMlr0030937
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=Nn2D+WaGrIxmv0
	Wq68a4X7vhTIYoCPgLur9GoEj1T7Q=; b=D6XrMZFsOgYJHaCizy9U7VUuM4BJn5
	JcfHpBVVAp9iPZLvmtm0C8Zx3WxQ7+7nmacRIj0IpLJWcS+6SrcYLaMbg1CejRHz
	oWaEvgr70YOPEYH4DOcIzv8gAOAyqU+uOA6HWMa0FoJbYXeROLuMSPsq1ouPb1/I
	X6kXLu9VJzOs0dJrbSc5RnvkquW0cPRzWwzv7rsKxVbaccTDwDUNrHmwXmfQwmC4
	eCnm1DG8EARjsR17dX01G5PWDKjwc4aZHhDgjIvM0vevEobbJp15sbRyC8fXc/zM
	toaXe7mzghT4VOl/9yEvQcFj55So8aP0vHUUtA5+bGeiZatb3OksW7OQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5aPXu017891
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29vb90-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmXuGmiNAKBVjAzbhFzroRsQBWyYJ4/3Gt+ezwa9SFaX1HlypmCJWsVs68+cK5ZB26zHvqOP+sf1beJpOzfF3OGjX8GxPvD1gcs11rVC8YtgtM+fNsgclEwSSN0IZX8lUNkrATAnp0OxcIzZAGYK9WcAhiL3rwCrmKsz7Y33002M2RRozcpfFnFiQ+2pLTBPe+IfnzPTOmIaKjOfzKh3w8oYtmK1Q5r3Ngd6DcD8feaoVOCQlTOt2qBlWZVcHcbW/QzYdCkRwQgwX5HAWlcLcWOd5xKsytZNgYrn/vco6n1jrFUmhT3893XWJoQWDKi1XAhxUUZAvfYWdTCgdLFk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nn2D+WaGrIxmv0Wq68a4X7vhTIYoCPgLur9GoEj1T7Q=;
 b=icql8dJphNCFR4bNsGrwEOE5H/efO+yL+hYGd9hr3AfgnMr4fBO0r6ZDycMHft/M0zfM52Qa0+37RyF8mT35N0jfYRVaY9I0PsPZ0xntwYq93pmMAhHWvM7RJ9EOLY+7/nZErzfYfhzpKsYAToWmrC4EfEFnkk3YtdgaLU0KCzECQbmoazc1IE5aer77vWNMs0TOQk5G+HA+X+J9XfAeQLEItUp6jAr3Yc2Vn8FBa7w+xRgpDFti0+VouL02gQyWlN0amxhefewvZqbA3LEDNKfUvy9aDFfevj1vdGk5JBiVr/HFlaQQfzUrhOmbSeG7XCSTAtldf8K3zN77opHcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nn2D+WaGrIxmv0Wq68a4X7vhTIYoCPgLur9GoEj1T7Q=;
 b=FY+nGa5398Yqf9lBXO4bDipV9cv/t8LAeKNYodXw8zg8lMdKf3GPG9PWL6UYTPLE4bMFTXpaBfpxauTavWHQ0TvpcmbftvFN84UcFgAwGx1JPEaVmDxB43xU5qAqVtHtVTIC0ClqYawjncaihaGOZeYiPzuZs9TJS//UOK35010=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:37 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:37 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 33/38] Eliminate dt_pdesc
Date: Thu, 27 Jun 2024 01:38:59 -0400
Message-Id: <20240627053904.21996-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ffaf55-151d-4e35-7241-08dc966b8830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sRLD+ip3PN/hiRUJreQQFlXD6lCRpZ9Bt1Y1EZUvlWi3iX6YanPISObdDHrK?=
 =?us-ascii?Q?J4JxTTCYg4PeP1EoFjw8SZFdj8PwXq5eurggoES9Rl6eNlJHl3eu9B/woXvU?=
 =?us-ascii?Q?ISoPsdJxqzNy2AF5PNn1HG6/cFz/TxMThppkOnkYxmxLZIkJlw1r7wpDLdvD?=
 =?us-ascii?Q?I2l7HucqHF+atTBbSzuQn3ozrPDJ9eo/dGaPEoX26vCqpg5/tTwtvZ/P7ok1?=
 =?us-ascii?Q?VWJROzcBStOpNGZRTBYW8MZavynqlVqqWuFVSKzBqSvttP/a4CvOXtAMvOk0?=
 =?us-ascii?Q?37Nj5GWgzGIbsy0o0LAuvCp3sQ0Tb5Tj5O9Poch6CSwk7jyN4m7h6tTqLaw6?=
 =?us-ascii?Q?aOR4+LQTqPYkFDih9qslI7qqBo8RjcjBLqt0u/GHnuBW/D8X/ZCNZlrZooxx?=
 =?us-ascii?Q?3i2iOkCxKSWHRgkCagEogMvdZ/I3lEq41+orwFlQIac9QqAlZZfL8axgA8s6?=
 =?us-ascii?Q?TN4ImOZFhnHNU4OyFm0AcjmwKICx+xGfUdCnMsgs+P+5x6Po8/gCQc7t96mR?=
 =?us-ascii?Q?oOOyOmfHTj7AyX1Uie/j1iWZjMw8bhhEBST/iQIIjFpqLGeDTme38EydS5e/?=
 =?us-ascii?Q?xE/jwkqfLPIWUI2iFA5a/95Jca3L7zqZWtbHFmA9Hya5Q3zMILOifFZm4oDf?=
 =?us-ascii?Q?QHISsmfcZnTxB7ISFqJYP1DcJ/ue3QKzhpvur4G1iuXR4Cds00/ns8ZtDnrN?=
 =?us-ascii?Q?39iMT/7OMuIJdRp76LpWFyta6EERbVPNncz7MpIhPv5K/TM5Ow6/+zcdozAU?=
 =?us-ascii?Q?TINU9/uJ4THBsTchGimcE84V5r+UvbKU7KlSDXhfe5u1e1SfWh+LsL9j+dOH?=
 =?us-ascii?Q?wM0sCviS0KqNIcQjfryzmALmg1CLzuuWnVdoNgamGYafyZwTfinOvttadVJT?=
 =?us-ascii?Q?OOAsG6mxkQZHx0ahVJR/7Hx7uHr1elRXLxcKFy4BhUJboVJX+hz20Z7GSyQX?=
 =?us-ascii?Q?2IHsAlk03srOWLj8P8tBHP5iyoMUBprcdQv9nXmfgGpWiyqvgn7HY2r1y8qU?=
 =?us-ascii?Q?7srYYlEp+SLEt4NjlauaKq2zx6n08tmxuUm96KwWmabfg4lIeUcuy2TOwQdj?=
 =?us-ascii?Q?8dLm5HZkUavNKR56uNS3McIdKHiCgwdB+sv/0cCEbbqDgdCCYo/7sS2Ryjrl?=
 =?us-ascii?Q?yZu0wHJRlWeT8IUHTky8hmhn3LXuEnx5iVwpeG+tG73HMiaBRxG/+b4qGKSe?=
 =?us-ascii?Q?BB5G/kAJq2REZY3javXGOqxf2lwHYMfgsRpTV+lOn5SCvyLLJyreS7UlgQKM?=
 =?us-ascii?Q?8dl8pxMqJX5m1gvC8FuzShiIYNGfA2Z4MpZAJlxmp+OBu4aEAJHIBvVFzhNg?=
 =?us-ascii?Q?QrY44z0ArdHWRvPIBsAn1zvk3KlF3Q+6U2UIF+PSFHZuhg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J2ZHevIgyOrwunL2m62mYNSsPWfXA2CFh4fEB/HL2EpptFmPw8awWRL3wVjV?=
 =?us-ascii?Q?kThy6pO8Cu97+y6JJVgHkATEvFo77GShl09qiw+p3BV1H7rzsEya7Gr64TUG?=
 =?us-ascii?Q?Vih82k5LIdZJk+D6Gb/q8REDVQnDy8XoImfhRBfXTmze0Wk1HidgPpupMlys?=
 =?us-ascii?Q?dLMj6pTFuSfbGYRmw6jg2jvMELURkaH6wV8r6lTr7NiR0lUYSFLdZML0cCFa?=
 =?us-ascii?Q?42TGKemIBCZx3al2jBQgB+VuSa+UcxT1dDwl2mj1c4Whdbtvzib3+R6naM2a?=
 =?us-ascii?Q?QUXwrru0ZrX2kXsxmWz9fwn/3GLSE8JX2zjHzEAryPGHv/L/gsUV55s9TRE9?=
 =?us-ascii?Q?5HGPhaBFeYN4AyVM1MJzYIKWt4qd9guAJh0/lCgmWAeGrt2MthgRVwtiubRS?=
 =?us-ascii?Q?G2RU+FPpC/pNqiICvi6efzjxi6SR2Zbu7moipVZ0XYYjgu24rKE7v/708Uhy?=
 =?us-ascii?Q?/+4e1cojCTkLnaZBCcc4FXX+UlFJ9IfjQ7r722BzhjZDWR3Bmw4HV1gL6oyv?=
 =?us-ascii?Q?IewqOLGL7Gp1mQuGvSK7faU5ei/Fo/lMLf3Kj8/oZXcGIAU22xrbyo/a5l3O?=
 =?us-ascii?Q?N582S9CeHQCZZ/ik8VdznE2dSlOuxmZPz6zF/kXTyPGlxuabGu23QM1kDCXy?=
 =?us-ascii?Q?E4a+OFoMAg7BnAL7LOMEhEdD6MNRoLSSiHzseEJkL3aes02fTDLQVs5qi9eZ?=
 =?us-ascii?Q?XNo2jRZ9o3DsMIlV9IdvtvRNyHIJdfzPUs8fz0Y+MAvNQochbVYWYnhQRGyy?=
 =?us-ascii?Q?T7zGG7RbP4MQKo53thgvUTrDLFPvhnpdg7ACl1wv177mBfk7fNQPuc1I55ny?=
 =?us-ascii?Q?Y63CKAswU7TMFCHuAWTZv7wvKfyI/kpAb+czfx2eRf3FWTT+66ih2dLe83BN?=
 =?us-ascii?Q?FA3eXMD4gOQ4jNJTQ4f+xnm5SYmoKizPywzMUwkbIf61sjW16vBk86BRHm1Y?=
 =?us-ascii?Q?nsgxq6N4PmWWROX7pj+iopWZ3pANojT3ALxm6Xekr3UJ04RoegiNBkfMcL/z?=
 =?us-ascii?Q?gRROK5Runc1DiVql1hbuVthfJkXgSwO4jNuRoeDN69UN4lSRVyOhwEGkRHd0?=
 =?us-ascii?Q?/BbARZR/gn4+w0uPGToQVaCd/s/oDJt1vI20RqXehj7bni+SYdpYZ4DcXR/t?=
 =?us-ascii?Q?0Ixx+BWzndQJHxG8wKTnzEYyFaUUroQRoultKySiJASVC2DcIcsGroJOwVG1?=
 =?us-ascii?Q?QliBBxb/ioqCXBQUCC5V92XaZ96GTzAQ4M2GR5m2SK+Tq08YMwxw6OI9lPn6?=
 =?us-ascii?Q?r7FzuMtyW3hui+yZPaQtnPFndepVAHNyy1Tkvhtvxd08FQ+Y01vE7JPFvSTj?=
 =?us-ascii?Q?oPv50CBBc5lSHvb3P5d631iiN2Ix6f52g9DJdyJzs84zzvroe8br37gR0/+b?=
 =?us-ascii?Q?ISx2MVAKeCZP9UabxyOgUhlnf680NPXvuYXqya2vqb/pxd7ERtz1sTJpGzWi?=
 =?us-ascii?Q?zfCZ79k/0Cd0i4wZxlQZSB14malMyva9Gk3u2ZLhhPrl8JUxtlwwpShawZWU?=
 =?us-ascii?Q?jCcglFZ/oDNP+fiFP8xqtTs82x/aEwLn3APiEmGfdO9VzZDReawf6ZyYxXiU?=
 =?us-ascii?Q?l0xJkSNnT6A3Qrbo1eN845B3tU27ZVVHmNOnIO05?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5BR+jyWOPZKoXmosPBQX+yh68UhaiDBqSQST80S0nf2mouCCQ+6G90Hx6KoTKFIvuBQwWRB5jQL1iYhmz2IsnFuecPtog7BeAMHztZDe5xhDG1Lxd6FXrjxS8G4BgLd74J1+Sz1LDGogTUAwp/HRTZYZaH0sZkhtMJPx4i1dZtHwNaayMJg73xMu63gAEIzXIOW+Ji8ofIPqGSMQBKKLw95hwVG12oHWvvALgtwW3by/PvD9MWUz45sJq4SBnQ20b/KLXN9RfA/Lgh8PgPOLsowmMx8NGI2bhdLuCau4PoBrYozqL3uOnllJPpxBi4wskt2Gou1qHHM9yN+iM7QEyAXoxtiicprCPDbTwtJdwDna0zpF/JNbQNAr8mh9rmjoEqaaqOzM7SeXbacgvJnaxE1v5JQosfQHKdLu+p5PPWVKxPgKtWe5ql6aRFawjZt/RkaWpdL5WnOGqeBgf2wS5AOyBu9/RIHco/urF1DeejWaGX3eLQB78BFCwPbNKB56lDj7dtnJ0HXlUNz1TIg186y1MfM6KILz/MGrqcFtXko3q7tf+dPMPtJ21o11tnriva8qt5gMFmBeEP5+zXJd971YvpF3wytQ3fWc2H/3I+M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ffaf55-151d-4e35-7241-08dc966b8830
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:37.1150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uknaYNHM1EiXp+1/epLeD6KZqBjKlyZY9WokHlSj4u/5I6ppkuLN6k4ipj61wjr1Tn7LrucSQLb3Kedui6CJ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: jt50GTvo9QEpVkRN306pkqcauXbzk_0g
X-Proofpoint-ORIG-GUID: jt50GTvo9QEpVkRN306pkqcauXbzk_0g

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c      |  8 +-------
 libdtrace/dt_consume.c |  3 +--
 libdtrace/dt_handle.c  |  2 +-
 libdtrace/dt_impl.h    |  7 ++-----
 libdtrace/dt_map.c     | 36 +++++++-----------------------------
 5 files changed, 12 insertions(+), 44 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 3d9a9c79..d09a9775 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -958,7 +958,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	uint_t			len = sdp->dtdo_brelen;
 	const dof_relodesc_t	*rp = sdp->dtdo_breltab;
 	dof_relodesc_t		*nrp = &dp->dtdo_breltab[rc];
-	dtrace_id_t		prid = prp->desc->id;
 	int			no_deps = 0;
 
 	if (idp != NULL) {
@@ -1199,11 +1198,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_STACK_SKIP:
 				nrp->dofr_data = prp->prov->impl->stack_skip;
 				continue;
-			default:
-				/* probe name -> value is probe id */
-				if (strchr(idp->di_name, ':') != NULL)
-					prid = rp->dofr_data;
-				continue;
 			}
 
 			continue;
@@ -1220,7 +1214,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			if (rdp == NULL)
 				return -1;
 			if (rdp->dtdo_ddesc != NULL) {
-				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc, prid);
+				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc);
 				clid++;
 			} else
 				nepid = 0;
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index adbd2c7f..8d96789e 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2229,8 +2229,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 	pdat->dtpda_epid = epid;
 	pdat->dtpda_data = data;
 
-	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc,
-					 &pdat->dtpda_pdesc);
+	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc);
 	if (rval != 0)
 		return dt_set_errno(dtp, EDT_BADEPID);
 	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index b1ba5f9f..79ecbac8 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -150,7 +150,7 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	 */
 	epid = DT_REC(uint64_t, 0);
 
-	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
+	if (dt_epid_lookup(dtp, epid, &errdd) != 0)
 		return dt_set_errno(dtp, EDT_BADERROR);
 	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
 	err.dteda_ddesc = errdd;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 445cd602..f8799b86 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -371,7 +371,6 @@ struct dtrace_hdl {
 	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
 	size_t dt_maxprobe;	/* max enabled probe ID */
 	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
-	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	dt_aggregate_t dt_aggregate; /* aggregate */
@@ -826,10 +825,8 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
 extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
-extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *,
-				 dtrace_id_t);
-extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **,
-			  dtrace_probedesc_t **);
+extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *);
+extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **);
 extern void dt_epid_destroy(dtrace_hdl_t *);
 typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
 extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index fe6194a7..513224ba 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -91,7 +91,7 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
  * description.
  */
 dtrace_epid_t
-dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
+dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
 {
 	dtrace_id_t	max = dtp->dt_maxprobe;
 	dtrace_epid_t	epid;
@@ -100,27 +100,19 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
 	if (epid >= max || dtp->dt_ddesc == NULL) {
 		dtrace_id_t		nmax = max ? (max << 1) : 2;
 		dtrace_datadesc_t	**nddesc;
-		dtrace_probedesc_t	**npdesc;
 
 		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
-		npdesc = dt_calloc(dtp, nmax, sizeof(void *));
-		if (nddesc == NULL || npdesc == NULL) {
-			dt_free(dtp, nddesc);
-			dt_free(dtp, npdesc);
+		if (nddesc == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
-		}
 
 		if (dtp->dt_ddesc != NULL) {
 			size_t	osize = max * sizeof(void *);
 
 			memcpy(nddesc, dtp->dt_ddesc, osize);
 			dt_free(dtp, dtp->dt_ddesc);
-			memcpy(npdesc, dtp->dt_pdesc, osize);
-			dt_free(dtp, dtp->dt_pdesc);
 		}
 
 		dtp->dt_ddesc = nddesc;
-		dtp->dt_pdesc = npdesc;
 		dtp->dt_maxprobe = nmax;
 	}
 
@@ -128,24 +120,20 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
 		return epid;
 
 	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
-	dtp->dt_pdesc[epid] = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 
 	return epid;
 }
 
 int
-dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
-	       dtrace_probedesc_t **pdp)
+dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
 {
 	/* Remove the PRID portion of the EPID. */
 	epid &= 0xffffffff;
 
-	if (epid >= dtp->dt_maxprobe ||
-	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
+	if (epid >= dtp->dt_maxprobe || dtp->dt_ddesc[epid] == NULL)
 		return -1;
 
 	*ddp = dtp->dt_ddesc[epid];
-	*pdp = dtp->dt_pdesc[epid];
 
 	return 0;
 }
@@ -155,26 +143,16 @@ dt_epid_destroy(dtrace_hdl_t *dtp)
 {
 	size_t i;
 
-	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
-	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
-	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
-
-	if (dtp->dt_pdesc == NULL)
-		return;
+	assert((dtp->dt_ddesc != NULL && dtp->dt_maxprobe > 0) ||
+	       (dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
 
 	for (i = 0; i < dtp->dt_maxprobe; i++) {
-		if (dtp->dt_ddesc[i] == NULL) {
-			assert(dtp->dt_pdesc[i] == NULL);
+		if (dtp->dt_ddesc[i] == NULL)
 			continue;
-		}
 
 		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
-		assert(dtp->dt_pdesc[i] != NULL);
 	}
 
-	free(dtp->dt_pdesc);
-	dtp->dt_pdesc = NULL;
-
 	free(dtp->dt_ddesc);
 	dtp->dt_ddesc = NULL;
 	dtp->dt_nextepid = 0;
-- 
2.18.4

