Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D7B2E370F
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576719; cv=fail; b=WZ5kDBgOOjVlIolREBvGwfxStpRWGTjGIgRaxEM63OGAxMLMhEllfIwOP/P9pAbBl+o0r5juEiUFBgyre8HTPXE8HqUjE0kl//0WAiywlWC13qsKgiIWr7PuMzH+z7GsSJrloEFV9xjA9pDcH0dlnKXU4zQN3qX1jOR0esL9m9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576719; c=relaxed/simple;
	bh=luRAs9FxCVPUSxIpMCMimsjrb1gNosV2mJv0wfTm/gM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=CLrDXlBvA6VUGoNo0qN2u3cKBOefEVQrJo30SBgJTu0UCmd09ZTYH9hXViwoaS/9tdubR3CptOo6xb3n1D6WhdzO4qR/zjDiCsw0oeQyXoGgNOjNC7f73j12KGZdWru9asCf0Y4pxKCJvI5zzZImz3gwzP3JOw6g1TIqHFBKzbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WwfPiE/d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s5S3Qq1O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WwfPiE/d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s5S3Qq1O"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YtLH011813
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vfRMQYZpbQcxriKYFw
	XRNgM496HpCJW31y+T/2r6+FM=; b=WwfPiE/dQQ/fsbDBETm5BzBFrGcdw7o5DL
	I+LBfA3ZCLalOYmTtD832viChfUuXUaRy/th3nFqsU/HRmXrLRNiZFvh2rc+oxvZ
	Y5YV1JCNOL5qUTtbihM3WRwEl+5eL26h8ettHk8/ZBoW4iwJvS4p/7WxJqNc0+QZ
	ZXqTr2iMgzacaN6uv1xao0qnkx/dmVxuTBPyC6ILaeEx+cTwbD2RIBWUOexXHo9r
	oydXCuDUkQFWaV3f6G/jhoAo/3EzlC//tb6zNetoe1vjpgzCywxL2kf0yl18NXG8
	gRX7eQv4YrBlHiWi7ZFCWKY20gLYXxGM3nHE6NiWvzG45vuRrAig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujy4pbk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:51:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F90gv0013724
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:51:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59adbt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkT5NfO372i8Ja4MODwJCaYwHR1Wy6A0nVqLYSWYBGC47PJ6q/M87qYiOe8AJdzh3ieTyauI5dp4moKw6Iqs6RuwhwMLPRF0KouKVWIy+HKcSh4tA3Uh6NG5+fKdPjcq57Tga44NusNuNSQFIPj/ZFir0cKYPBLk6ARovD3kZmHTe3FUi8rTsvDG/sVQosxqOrzB2rvKbtTjc9gWl9skVvM/QQ5zKoyaZnoQMa3KEsRCiNpTC8T8Z70TSM/8mFXrdkB17qkvG2zA6oLdl9rIQNOn8YiuTJtaTGvuT/hLtqAGnUGcdld8ugTs27o35Jo5hu3eRvfCCu2r4CRg+3ZSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfRMQYZpbQcxriKYFwXRNgM496HpCJW31y+T/2r6+FM=;
 b=rKWcixE36MF6SOywtbE8RKHydJ5fMMusuG47u/25dQ/T1rjnV8cix8ibUPQgyqbqd02nECL7dJmqbyhE8KAn7ivSJ5eP2prGEBR8F6dzKc4J3nBARGTbCkei6jqvWvdAcrL3d7YxOtnk1LgRfaGlJRIC6nWnnmdfq71UYQiTlxOfVs080pfY4GpAuifYf9fRmHSvTrtI9VCRzhNcoXkDQSgPeFywiLqTWQP6q2exdEq8npQ91qWMvCURdZhPSgAs0WYo762I6qz8/+oDIyjKj02K/YzSbiVYEXKTFnCCxiCI5kflPTtyun41xfp7A4Sw+3IzY+5Fks61t3XyHvFZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfRMQYZpbQcxriKYFwXRNgM496HpCJW31y+T/2r6+FM=;
 b=s5S3Qq1Ocrd1GhlD2qKk5/a+/1N9P2LOlX2dhe7woNn+jrIiSg0llIPXmwn8GUh4naDw0MU+omhz4e2ANrNLkCHKFZcqP7Et2sVhRwIAVlyQ6GR0q4VEsU13elfasXbDNM69YTPugSNsSk52zwHF4OaACB7HD5j3l6+6qkP96Sc=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS0PR10MB6920.namprd10.prod.outlook.com (2603:10b6:8:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Tue, 15 Jul
 2025 10:51:52 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:51:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] cg: reject clauses using return() by default
References: <SJ0PR10MB567264A32C578A83EC920284C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<878qkpwxho.fsf@esperi.org.uk>
Emacs: don't cry -- it won't help.
Date: Tue, 15 Jul 2025 11:51:50 +0100
In-Reply-To: <878qkpwxho.fsf@esperi.org.uk> (Nick Alcock's message of "Tue, 15
	Jul 2025 11:37:39 +0100")
Message-ID: <87tt3dvi9l.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::13) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS0PR10MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 1688fccf-cdca-464d-904b-08ddc38d9b72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vq9nboGAaM6VFEBSdR88S3jtMSTjVZIfruLTQ9IkHMQ2w2Qa8bHNe9FpGpw9?=
 =?us-ascii?Q?DpsAqAya42m655v4Gc9/2sqvE4tLANL2CRs9IX4SSTfwlU7tsxCCz3ENtyhy?=
 =?us-ascii?Q?IOpyGRc1Nr5x7tDGVoE5SknpRafjnCW/vh29MTRTFTV1bDIbYSM/YRuMTeGX?=
 =?us-ascii?Q?Z3ZLAAQGVG0SMUS2cR0a7yElUhcRR5t/wWtBWBGND9pTQHqWuweu72TCS7Nw?=
 =?us-ascii?Q?erE00+a3TqboV4zXCP58jOlD6udFxDvhpVW7EonVgDJEDm3Bnt8jZMYyF1w7?=
 =?us-ascii?Q?9IoZd5gQt2Grx8i4sroA+zg1xcmT1+OdA+NdCsANOe2nEzuweOav1uAR2Gu9?=
 =?us-ascii?Q?QdaoLtk7pNHqNU4oOEnvCmMur1UAlWHU5pGfK/EmBs2d21k5V0S/60UuxOlY?=
 =?us-ascii?Q?9S7CxBvya2YrK+SRbqeQejL28whBqMTNW4H+LZ3QLfoy8Kz8vWsPb40F0Uc9?=
 =?us-ascii?Q?dW71xnrmc4GugudWhHgSal79inQZkw5Jb0W+53BehIOY1yB8KEbKN6wM3rVX?=
 =?us-ascii?Q?84eVkiCy9Pz0op8Nox93Kt1HXgqrTT1rShByo4hn+NdLFIszQfRekuPq2FDB?=
 =?us-ascii?Q?aq9qmeDe2MkyUFR7QU+rOX9RCtxngL8+tM5H2RwBtv4BfohzIes8SZ7Eg0Nr?=
 =?us-ascii?Q?MKIU8ZLIb4YPNo4KaryQ/ySPozoylvBP/BkVjD0uB/R5CXpN/kPmm/T2leVa?=
 =?us-ascii?Q?37nDXjOgrA7wJAFuss3eqJtqIGiipeEKlTFjvuMifNukzNXMBtS7dvAOYRlg?=
 =?us-ascii?Q?t2GmqiqgqxnHFSlvTsa/PYx/Sg8W08U5GeTV+OYGGLz9mQqEVGwbQ/u7TLN7?=
 =?us-ascii?Q?BZ3tGiTntUWuP7mudZM4b0F6LNhVvCoSc9kaaim4wSqeSov1fXNUzXf9H23X?=
 =?us-ascii?Q?lBktX5FLJltpknByhfHt8Gm2naA1qEwlumb8MviAAHIjTF7cWelAQB5+/Jzx?=
 =?us-ascii?Q?4HJDn0WUnlX0EB5o04aFhawEX/a2yASxBAfKlD/W0zf8tno+JZ4S43Svjzef?=
 =?us-ascii?Q?vgwGNunfWHx7QmMm8h2/ec7m2ki8UPMk0oVCMrtMoHfi64CN1vjJgYDJVdrM?=
 =?us-ascii?Q?U3A+JL9nBNBHwpBp/Ki4Ca3iGUItsnd+wJ5O1JC4P3sicovLeWJepKu21HwE?=
 =?us-ascii?Q?t2z/1IFVHxOgE063fUUPrvsSeuMWISNMGNPXijxTtkxf8W1Ktbw8yZ5El3iL?=
 =?us-ascii?Q?O/ztRDp1+qF1TUP06nEx+MujKiqZyiJXYzxnrVQ/ZEOYMpj3vQcsRutT+5vt?=
 =?us-ascii?Q?mxBy5uGBafKyIQvTHM6SSMnuSauI933ULtjnJIPALaV1kuAgkWPIrGNt+BGt?=
 =?us-ascii?Q?T64lCLWP4VSCbkXPYcvdaC6BmN1eoLXunqAwMJ+sQpbzuQ+gfHQs8Cqk5V2g?=
 =?us-ascii?Q?Kks68W9ra0xfmD+fslIOaKA05IXaImHLQ4ao/MyY+qEK2ntbx/tBt2AI+Cel?=
 =?us-ascii?Q?sOrLW86kHzc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WAxc8EAExKu+D+XYvbpJU2WsgEidUKInNPzsRO70hC+h4wtH3MD8M7GkUZ9z?=
 =?us-ascii?Q?vq/02pYVvaJUVvR7zU9KzSODFVQLUnEzTAotZnhBecj+qwqt/CcVWghtUSBp?=
 =?us-ascii?Q?gFSIL8bv64tasBzkeOFc1QtHxIrOfRs5tpPtyqB0sUbjpOCWC6Si0hNq/8DL?=
 =?us-ascii?Q?yvJ1Z+HlcvsysEe7MiSN2tWZCqbaExPFF6vRtPFTpGqakfUV297rYQ/BbG1G?=
 =?us-ascii?Q?v1KMDBkU81IoVej7VuPYF1ZRdAbN9zmxSGk3u/Y8l6UlGPJZDpExQhewdAEV?=
 =?us-ascii?Q?U06UI+0SVMULvBfTxWVGitgvXxXGLJ5bZQeFPNPhHBBO259FTEfULlNw4REu?=
 =?us-ascii?Q?FkUsqSseSTQc6F1GjPDNXAqdw/4KeJeIM/+/ZxLECsx+tMb304retQf5ITgV?=
 =?us-ascii?Q?Y5JOX8aFCaHrcoQXy7XTiDNGU2foJI+4OGzfTr9JBKbDjvaaevRfgRNwKdmd?=
 =?us-ascii?Q?5PY/XH3LsGrRT25LGfAR7XVZATPuCg0EfmQxJo6XKcWdvspgtmSfSBWs+4hJ?=
 =?us-ascii?Q?B+ET/PZy3ZC7d2Oi1rOSfruPDYdNtDwt0SkQqVuINy1nIK5e+NEgzta557eq?=
 =?us-ascii?Q?1aJoMFx+R/pm5YzBP4XhfC5la+9muH57gM9dgAhV/WMluiR/212UwaEPwFVc?=
 =?us-ascii?Q?3EQ1pV6AQf3IDsFwGyTNeE4X8nm+QSrAx2g9J4RUefGkZ7XEaHeFn5gA6PVS?=
 =?us-ascii?Q?a/Elz6374vAGBRhVjoUOMbsyPHrTbj4pIEWrOyIo+LKTXcZQMItv1MuMJCpA?=
 =?us-ascii?Q?QOEoJpe4pucOCXIjLpsakDs0gMdzEtNqB6owLPpjydgBA8aUwplfonAUsqvh?=
 =?us-ascii?Q?z/454R3e6jU6hAqYsNF9nCwC2+D4u5Lz+fxQK+Y3LNSZDUJyNFYhCgQ4V6pu?=
 =?us-ascii?Q?VWIuLfjVbPV87DfaHVeHJQQvHSa3bLv9HlJecWAAjnxYdrBSzCjZ11aXnfGx?=
 =?us-ascii?Q?9irJUeFy+4F3nuO3yq7BmrdKGACMdjYW4xLU8POIeurWW0Rf8/DaJcvRs/iK?=
 =?us-ascii?Q?FOi+Ocr6TB8UuWVIfSsLsS/OokT8M/xMG5UmZ8oGemF/q5vsKo+n+pvoQSIK?=
 =?us-ascii?Q?XEjlXPVuEd9Cmmloi5MaTWCpPmq3ac1JA0LCBDkewS7hxZ9wYvywkipGn6Fb?=
 =?us-ascii?Q?PiN0sf5iqUwcE3tHDbatvCRKR8UjVZMe0RcbXWnevAUeKXSldaIO6a34X+o9?=
 =?us-ascii?Q?y5X0TAEynPgPgcBwnC0nMxHp7NkcdAc3x02Kt/iOC656SRVEgokJV2rf5DOD?=
 =?us-ascii?Q?X8YCYB2SsbpuoVE13AxGZB/Vt61YqtavDNAnjy4VQKM06lpcfWwO5yefPtlV?=
 =?us-ascii?Q?G+JMXCp4ev7MKMSP6sNjgGWDOnII6GKj9CwhfGpduYQzmuFCgfSG32aUk/yq?=
 =?us-ascii?Q?lQgbAD95fajZJwznp9NagK/gc7J/uLTN7TKOOG6eT+x/wWVlvW0u1qvFpW0X?=
 =?us-ascii?Q?RwIF7Inekeu/fyZTTikP6nfbkBzXZaquhvXYG87whz2emfmVxDreT1x5p8i/?=
 =?us-ascii?Q?qCX/LE4Cw5nkTzGYtYZ9JrwQ0iRSD/uu4Fi4NM7fvMNqKMQvKBvaunq4Qyps?=
 =?us-ascii?Q?mRBkfvLc+k9c4kzF/oo9SARpC9ABsiItQq3F5oGN5GoOv8zjPEZcjlA3asTT?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ab7hOeNbbWDQ/fkWHuX0Wa7tF2OXme9OHzFfZzzVEE7nVlGlCHNJqDYXtAJcfpCA+6c+eSHI1d1d/wW4VK+8IQfu4j5RWtTW5NJYwcatJMLIOj9f3NaeZ+ri25Qw/pXmKu79b/JrMexeGUTKS2ets++fYDGTIe4rfY5MJVHwrYey0Y6o56yqTfGjXdlgPmoX4MxFzrkEwvLFWiKwedvmmQh9ADQHDFtjhzD3BcRENMEbYSGTDNV992YtY89A8PAk/aGBGS8aUGfd+EWK3lAqGpN9BUmuB3AalmpuKrIKkD+QMkxuUfEkeLJ8HKyR0HPffW2iRXYr7iOAptI4FYUagjrErdfimWqFCUkMG8Xk83sZYJgwXR74ExLysNOcMfsBw4loKUNPTXdznpSoMDdZahToJNU0Pf1m9KRdk8KeFzhnyejsI/1Gi+8a28JP626R4QDjXmDAgDZx5qTUk7LwS978OmfaDlh3nXxR+XdQj4xwzV5ileGq9LNKYRnDR+FMxuZuZj3D/nRxiOc1P6A7ZizTq4fq4OnhyC3xHoU5D6/bDo2DackHS1CZ1wzl0b0Xajbt/pAsehkw8ISTqss3KWlSStJDOk4wG2si5bGOGTc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1688fccf-cdca-464d-904b-08ddc38d9b72
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:51:52.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sis7BXLuJ7DjGaRifcUUXWdAiBsA3Qlpz0nB7m+wUXj/2JIP4pOWUqnHtI/MQ/asJcPp5sO6eYA/d+XmqT5UuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150098
X-Proofpoint-ORIG-GUID: V6kUysc06iJVsSQhagPCd2v7pkexPMV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OSBTYWx0ZWRfX1/mhQsh1vxpF 4m0L1gZZUdyYN6peiTKp6jJXfzpNr+bOFD387cHdb1jYtVHWLKdIBom+csuN6UzbB+qSqgowLdj rvjNuhYFhNCCZYGtnGk/aSmP+fK1YdRFjuPxwLvUjGd2Gu5nkO8S4+QzKrG4o8n0F5WIAKoiEPg
 VpcFZ8ysddDTkeFxh4+wKkeP8VWxTHzlUpLLgbsbTHacaKtVTF1FQgRFx9tGwlVGGVSHky0erQi vpqZAAgphlJ6lVgO1h+erAVeRW5f5liEnZJxT8G7dWoZ5fhsZU7gTZy20RyFfUIBTJSrR6IiOwp yQ8zFZRcP1IEFrYCMTv965g+eAuTyESE2YE61+QYjvtkkwVuXMN1Ub/FGLzJSFl34wDu3lE0aRh
 buhVgwNpyMp5sY65KD/5EtfZeFZe4l9KiJwVxqczhvyveAQOhnfipOZXykwKjcQPrsmng0Zj
X-Authority-Analysis: v=2.4 cv=Xtr6OUF9 c=1 sm=1 tr=0 ts=687632cd b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_CanZN-fFIFBGKs5HdUA:9 cc=ntf awl=host:12061
X-Proofpoint-GUID: V6kUysc06iJVsSQhagPCd2v7pkexPMV4

On 15 Jul 2025, Nick Alcock spake thusly:

> On 15 Jul 2025, Kris Van Hees verbalised:
>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>
>> ---
>>  libdtrace/dt_cg.c      | 10 +++++++++-
>>  libdtrace/dt_errtags.h |  1 +
>>  libdtrace/dtrace.h     | 19 ++++++++++---------
>>  3 files changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 738597ed..0607cd4e 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -875,6 +875,10 @@ dt_cg_call_clause(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, dt_clause_arg_t *ar
>>  	 */
>>  	if (prp->prov->impl->reject_clause != NULL)
>>  		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
>> +	else if (sdp->dtsd_clauseflags & DT_CLSFLAG_RETURN)
>> +		xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
>> +			prp->desc->prv, prp->desc->mod, prp->desc->fun,
>> +			prp->desc->prb);
>
> Ah, I guess these are the "default checks" given in the previous commit,
> so you can just set up the reject_clause() if destructive mode is on,
> and not need to check here at all.

No, nonsense -- dt_cg_clsflags turns on the destructive flag whenever it
turns on the return flag. Which is fine. (This behaviour is still
somewhat irregular, but I guess if anything can have special handling in
dt_cg_call_clause it would be something named return :) )

-- 
NULL && (void)
