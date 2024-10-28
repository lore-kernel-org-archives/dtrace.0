Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47118FC75
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730149916; cv=fail; b=GFh+qzNWLw8gVVNHjX9q0YuNs8Acpbk/BKRlAvARV6HWuCeDygNCWPnedY+QfNS2PIUr6By7RG8fPdpFBjOolhVmK+nfuS3zHF87vmFWbUXoq0yd3TJ8DmhYMOoUVxz41Put9gFXQGj0Zi8LeSPufbVI50cAsK7bqJrBD+GUwb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730149916; c=relaxed/simple;
	bh=CNF5jGhTDHQ7p85RIf7TG1FYM5X7QyFOaAD7Q0h8sAc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=sFyGjKHVbkxD8Pa5ZwpTdO4nEkctF8IE1MDaX7w4hfgQPthfGt+ORXmYaO65jqGYm1V2cCexyAJSkT1Ym5fjlxcut+rtUrrimQZx64AC8ULd+fQmBu3+dd4KGaHgRNAbRITn+K+BJW8p+zjql3s18NHtvyfCphMItWF5G3opuB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nuVPkpbO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=po8UDgr8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nuVPkpbO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="po8UDgr8"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKta1G020952
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=U4biTXZIWNvKQyeNec
	4gIhfR+nsDQ/b09eV2ENYbXE8=; b=nuVPkpbOZWk18iN9Y7uvlAvlWaQ+n9OKj/
	tDo42RjGxbJTSiHFo3kBV806EsL1Yt38oHWKW4YwkfRhndh+3sFoG+MCeWmR3toh
	5xqVRarlHbE2Kb73/TCldl9UJ5eS8Mmo38d/xVcdfWpKJvatf1RA38FE1p+wXpzR
	/AHED+++0rw4lnMDTrqRlrtLih1Cfu/hljIaulSkSsSIisq8m3++z6dof/wn13K8
	pL+ligXJd+aWR7hZcLiAUZ29/13ptFooUCmAu/gU9EYaESfsEl/Z7fE924ME1HWF
	ziwGDyBadhx3kmTkkZ7iNle11WFkTkFMNuzhbD2PGHo4G36udfNQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp3yje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:11:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK2frF004789
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:11:50 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t772j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3e8+gynZPhjg7cpsawhy8bgkNP3cCgdmGfsaTVfnZDG7khuVtRe7r9g5jNYhLppTRmPno/PkvlHyLiHndAT07hsqOoI3pdBi2LQ7/jtPGSwvB8Tm43VXflPzT9TUdQbp/SZuZM07ixu7oe9NplxU0jS+ZT0iQ/hm5C8QuyqX23PHZQzm06L271ISA47RDIXERk68PwbfqkIUgZ/NmvJA8gSk2xdhly1Dz3LzkU8wGZpUYTAZBdHSD2TqFdvidhwBDNLEVDKJE2kW1MaCmXMyq6mNStx0nC3ZNL+ogL3hCqznqrTjLYJv4Co2B/nRJO2PL0f5d2tlBxNsdPtfabzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4biTXZIWNvKQyeNec4gIhfR+nsDQ/b09eV2ENYbXE8=;
 b=EhWm57/rt2mAIoVhL1lxIVglwtiT4kXSFRs3XNw1NxquB4W1kPt0zfwG+QtV3Rz183kyOE8oO63hYXTA/qR1EjswLxaiYDrKTcu2w7PIA8/LnaEujTUnFHvmNXIFQlxzgpgcLXWQ3++Kddfa6jL2t+Yxp+RQndAdOUHovSQiqErKF0eM4gDJgjHvLtzToF3sBpy39EYZRzXdcm1sIG3tgR5YnDXLtyPdQFptrx+/4Ihak1oyZPkl+v2jGu3Plb43nuFA2m/ShOQf1xzWhZv/esTtobtwl97qRYXQbk08SWtXv19IJ5BkV+142ydQs/NDm1wOfV1NBoNufl5mXGFWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4biTXZIWNvKQyeNec4gIhfR+nsDQ/b09eV2ENYbXE8=;
 b=po8UDgr8FZkUpF88s2T9SkpMiAY5sGN6dwVjlezG4YjwyjIBi5Fiy+jBVgfKVY6/5pmQWOcEN7EjlpAOA4wHjmGWp4ghTyPF3IobvpTFdgDytFsJg3Gb5XzN5KCGkFdlE1NgwMNLuvkcmiDATlq5BnhQDHxY5UPbABqAvn+Sf7c=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BN0PR10MB5062.namprd10.prod.outlook.com (2603:10b6:408:12c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 21:11:47 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:11:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] cg: add argument remapping in the trampoline
References: <20241018195808.270688-1-nick.alcock@oracle.com>
	<20241018195808.270688-5-nick.alcock@oracle.com>
	<ZxfkWjbS1c0vXLvn@oracle.com> <87plnorxat.fsf@esperi.org.uk>
	<ZxvuWjuWbfweZmgj@oracle.com>
Emacs: don't try this at home, kids!
Date: Mon, 28 Oct 2024 21:11:42 +0000
In-Reply-To: <ZxvuWjuWbfweZmgj@oracle.com> (Kris Van Hees's message of "Fri,
	25 Oct 2024 15:15:38 -0400")
Message-ID: <87r080oru9.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BN0PR10MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b09337d-a15b-479b-571b-08dcf79521f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jq4t3ztS+XXDp/rPjWh0/HnOFMGh8lYLkxFZ8zvCu2q2ZZ2QGV7DydUPg85G?=
 =?us-ascii?Q?GzAndaUOKET7Cdg6EycdLlHvYOUP1sEbL6o4PWXDohxA55YuCReNO+zBi+rm?=
 =?us-ascii?Q?uSBvD54r9ipMhKcBFb9232JVXwgy/JuEE+1uG4YQG6MqVQmFVG0HUENIB0Tc?=
 =?us-ascii?Q?S+yYE8L3TPvXIApcQ3Mwj7zeuZfLclqg+X+KvnZweJUiq57OFWD5R962jPBb?=
 =?us-ascii?Q?0DT9xhbWlRMyWLo06BbT9T1HS7WrY8zHCUN/FbpNprlAuapWXI2JPbvQB5rg?=
 =?us-ascii?Q?SOf2RV42fzPm7TfBpo8evkUWkKGEkSYmm/nKb8A7pGISujELrVBryPstxQGy?=
 =?us-ascii?Q?oGRlXoCvzMNmjYu+WcFjQop9u/4Gr8D6Bn5aPi1o/L4hj5/wSq80qLwaygzy?=
 =?us-ascii?Q?/NQ9ukOBr6AmHO7+WTV4W0kHV8KOEciZwSVzrL6OFOvt9h1FcHd0SiLAf9l2?=
 =?us-ascii?Q?ojI14Ihve9DgadHomj+/hDUZwfeT5IRkknO7Hj+D7FXA2qBBx4zkZ4pA2Dzo?=
 =?us-ascii?Q?4cXJSk2PIvDs3/NUAvLQPmeSjwWDT3cnGcOBPZuhxL7J5kw2q1Sc9RRIIEQ3?=
 =?us-ascii?Q?1Cp+eeBsVCOAalgXXcCdUwcjvV+trG3NYH10AhzH2lfP10dSE4PwiaR/UBwr?=
 =?us-ascii?Q?mxkUvQ8v5jFHtYtBPgLZgYbFPsFcc9ZAVhr1YlKq3oeaoK5yf4bdndLwVeaA?=
 =?us-ascii?Q?boZ0M7aQa2sy6TOI0qbWFfdFQ6gYseSApaLn4ne6m5QQi6j34Sem+B006/NF?=
 =?us-ascii?Q?Qh09cEGQaijCflk+smm497Ou5xmLq9EWhud+zmbAGM8vd2prw0netRb0Y9No?=
 =?us-ascii?Q?IfPeZex1p7BA32de6rlgwuqHBXkT/lS6C3tt7BRV3cLWE9JNfKT6WmewhUQz?=
 =?us-ascii?Q?uuCFDp6iJr/DAt+bG7qoQi4vS6EgK5Ia9rvnVeR9E9KVdjzbx/Far8YT4gXb?=
 =?us-ascii?Q?gUjCgickvBt1U3hxIZv2aI4A2feWkPy+AAUWsS+KUXzYLomA2/VBE7Hw87d9?=
 =?us-ascii?Q?UuT1CtHBE/w+UIcLYqtWKEXYszMNPAswtLc3urP1o1LtrUGjieJ9DgHciWdB?=
 =?us-ascii?Q?NDJre5uHpkobCsb+4dVw+HkZ4VbSHQOtGKpt0lsrrlsQ9IMODlnJnhMfjPqf?=
 =?us-ascii?Q?tGn54+JSW31lQBjDVBN8eUCJzn9Nbg5Afq9BoPvwTP0q9JJLF35q5tJlLHPV?=
 =?us-ascii?Q?2JnxXrAGyjDqa5cGxiqFyY1VTGGBA6hjCQeEKMJD2/V+DaGNV/UPONdnee/K?=
 =?us-ascii?Q?v8z2dKrDSZkD5NgxiaWCRPi3kRHfZnr1LdoeyL7w8SEkqP8xvTn9u65v+A63?=
 =?us-ascii?Q?ysq4T8teO7vvua6Q2c2u+JoT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BWxrb5WgEZjmCm9LPtjjitnD2eRy4tqIcLU/kv3bCR1cGGpROhL/8C2dEggf?=
 =?us-ascii?Q?NcMfAYiG6TyqV4ma98+PhxpoVFBQDYcEoZsKeIOZHbVH2N7ChHPyPQchtxOs?=
 =?us-ascii?Q?DmwM9tzrJXoRuf71NLk6+0/rL/6QndWDo01AhbHujNGrftEg1/cW5bN6CBhl?=
 =?us-ascii?Q?CnAsaZCzN3fLjmNCB767QnJfxClAtDQuJjUtsVTHzK2GMwgoIqqKgNuHJR7D?=
 =?us-ascii?Q?kZx0iYhvCC4UeVEOMCGIMHEfr1b91QGAnG+JjBGeyd7nCauMR5+fhS8H5gm5?=
 =?us-ascii?Q?xc4P23FuoaaeCrYhHr05ZE6xxi3v6zv6Tn2sQIXFhA0c2FIaBqlXU3KkKFcH?=
 =?us-ascii?Q?g7+/poTFcgb9jCVedVCunQm7cheVP/R466Y/xOsgAURQn+rw6rM/h2UEqKUc?=
 =?us-ascii?Q?NRM+Hj52thIA1Ixt5OVMnVgmQA/Wv6Q6b/o6lsYAW26iR5kCSuyJtevgOLf8?=
 =?us-ascii?Q?12MeuOxrFE9guuk36wwNU+C/LD9NVA7gFbqUHds9vzkPFdRHHYz0qkuYxrkP?=
 =?us-ascii?Q?l6Ce9gkahd6xASb9cvqXdpiUOLXNN7HU/F0vmThnb2hAKvNctxxMHZFkn8um?=
 =?us-ascii?Q?1F2IqICK4/Jtx0xX7oEID2+j3QRBlHC40jHbRsv5k8WYp5aQApIGPd8154Gh?=
 =?us-ascii?Q?6jnQwHhpGOdeKow97YDUnodhclRGLjUDNV3IHylTJig9ih2pCmzZyTuauRTk?=
 =?us-ascii?Q?o76bBTi0lXYlGIJUUzGX5r0R7aW/iMkg4AlNnfxcxSg4bzv6Sd1U3+NBJuWo?=
 =?us-ascii?Q?ATR7X4cF3TQQXj2G44cgtP2lj6LU5eWRvyrM+HMj8jeGEpmDlJncvhzREfRD?=
 =?us-ascii?Q?5/oX5yyTdD9eatwVUqWerVEBVih72hTJpZLLLiwPXBRbXywP+QRpQKLbP56E?=
 =?us-ascii?Q?FKx3JEkdmPdLnG/IN1EghSydAN1wn7lX7nSOb5iEOJHRbGCdrGJbhBmF0T0e?=
 =?us-ascii?Q?ywrx2HlHg4CnZ+YF+MYCTbo/+geTkZVjdf+c75DTAad8jno8o9oZCFmIIroY?=
 =?us-ascii?Q?s0U1uxT5ARf4leuijModElw3u+kYeDNMaP9c99BoTb99bkNYwYXHxAtEFJiu?=
 =?us-ascii?Q?LyYIzJ8bA9g4CSmgddpxoYCs4oJ1By1jTGX+GKK4eKOIvYFmxn7Ve1THXrGD?=
 =?us-ascii?Q?Sb3ak2EojMvMy6JAVNQ8IudZdjXNAvBJA/tFZgeQu4r51pALNRdJBvwldFBY?=
 =?us-ascii?Q?CTXwNJoyyQSDwIZtgdo1QwgIbljoN4/OnUfjn2pYf5dPWWLpH/QCN+Bpgky7?=
 =?us-ascii?Q?lYx/Cj+DOdZAfN/QwkFuueMZPXyNx/ujbAWHscfUExsuWWnw3tVzMlTrri4t?=
 =?us-ascii?Q?T7U6RjMsgPtXSM5G1oXeuplYvNyXwwGX0IIe50WLAfoyTyXkPR1Gj6YQ3Lu8?=
 =?us-ascii?Q?2X5slR55OLC5xXBr3DmYUdjGBSnRg3Y0UnlLQIes4qS0l3mhBykjXyJvqhAh?=
 =?us-ascii?Q?NCXqcY24vbINqRgaABrbZD1j20DuqIL0qIxMr3tkaHGwWvzuYGPXqVCJibi2?=
 =?us-ascii?Q?hmcd/q5vzLaVa3yucMZO3fcyyGQybqfQhJuC2YE2wv7CDtn3iCvINHu/6ReV?=
 =?us-ascii?Q?ASaYXg6JLBu4aeeGA5ZN/9WIvbFT9AI3PvUeMm3Tq+pDXqF4mRtSJV0ok6Zl?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RrgRXPwqhwlY7oqURcr3bnqUpojIMfTGu92iCGPpY3oMDa+mnKfmotT3taKYvthyBVvEj3Fn+AGU56EdUjtFjNq/wruiMtSBuUUUYAwrZCYi1q36yVNObb3o7ZX7KSWipYimuHQcR/okzWIkwEHpLtKgmssoLJZdRRA7iL4lYOIq2mgUkPFuFfs/5KSspWFqTMP44q+eC9FDNmMcK4xwGLpRYt6Q8cPbfFlYWBZkDR77uORu8nsAvFgrdCrgKbuOC/DFy9QlHO0zG2jkthiaN5OrOMQ9VlzBM0nGTIH5UArIA3khCI9ubbwceE4YbiPZo6oGtjmhgf653AtGnAgq96OPfqB6FcGLlFNEXx12YaaHEp4NlZ27dv+tp29IPGWRdlW/juD2Mwxnn97zIg/rWwAiTOclmFW2QiQ8HgDpsV2PKKmMSZLSINLax85yo119VNgn4FAln4G/2FkXCAMzGD/EC0gO70lIXQQTlJTK1T33gkakCBDKSaXH0h/TcuOlL6fXXoLB54AwwfvaxHA0s5KcjRTTNm/Fql5HZPhHbQW5pmP2rKLpVvSmvmWX9oz5nSgeoJORvP3RyYiz8csfHFGHKql8/haayhhsuIEja64=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b09337d-a15b-479b-571b-08dcf79521f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:11:47.4733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wfEBkLHPxt/v4tKAawnWgvJHyRbKZWF7C460XvpZZnKDVrAfU7mN53TtSO9mHI6fWGHREk9/shmV+jEnOoipAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5062
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: qNasQPlCLd2Mp1dZFmdipSR7tWWoVVg2
X-Proofpoint-GUID: qNasQPlCLd2Mp1dZFmdipSR7tWWoVVg2

On 25 Oct 2024, Kris Van Hees verbalised:
> On Fri, Oct 25, 2024 at 04:56:26PM +0100, Nick Alcock wrote:
>> > I also disagree that the function performs the saving of arguments itself.
>> > I think that the caller ought to take care of that, because the caller has a
>> > much better idea about when/if to save arguments, and when/if to restore them.
>> 
>> Well, the reshuffling is *done* by saving arguments and then copying
>> them out of the saved orig_arg area into the args area, so either it
>> does the saving itself, or it silently malfunctions if the caller
>> doesn't save, or it reimplements all the saving infrastructure for no
>> other reason than to use a *different name* so the caller can save.
>> 
>> The latter two options seem, well, entirely terrible, so I went the
>> former route.
>
> The way this has been implemented already for SDT and the design behind that
> is that the underlying probe saves arguments before overlying probes do
> anything with them.  The reshuffling is only one of the things that might
> get done to arguments, and since there may be multiple overlying probes that
> have different arguments, the caller needs to preserve the arguments it was
> given in case any of the overlying ones changes them.

... that doesn't help me figure out what you want me to do. Can I save
the args and then pick them out in a reshuffled fashion, or what? I'm
trying to avoid having to write some sort of nightmarish in-place
shuffler in raw BPF here, because I'm fairly sure doing so would drive
me quite mad and take forever. Saving all the args and picking them out
in the reshuffled order is only a couple of lines. (See below.)

I still have no idea what's wrong with saving the args in
dt_cg_tramp_remap_args(): it will only cause trouble if something else
has saved the args before trampoline() is called, then modified them,
then expects to restore the originals after the trampoline(). Surely
nothing does that?

>> >> The remapping info is still propagated up out of per-provider state so that
>> >> the parser can use it to tell what types the remapped arguments are and
>> >> to apply array-op remapping: users of dt_cg_tramp_remap_args() should set
>> >> the probe remapping to 1:1 and shuffle the native types correspondingly,
>> >> to match what dt_cg_tramp_remap_args() has done (in effect, calling it has
>> >> moved the native types around).
>> >
>> > I would drop this paragraph.  It is unnecessary and speculative at best about
>> > what other code should or should not do.
>> 
>> Hardly. It's documentation about how other code can get the arg types
>> right if they are using dt_cg_tramp_remap_args(). Would you prefer I
>> leave this entirely undescribed?! I could put it in a comment above
>> dt_cg_tramp_remap_args() (or rather the renamed dt_cg_tramp_map_args())
>> instead.
>> 
>> (Shifted into a comment, for now.)
>
> But that is not relevant to this patch, and other code shouldn't be doing this
> because it is almost certainly wrong that USDT is remapping the arguments in
> the trampoline because of the argN vs args[N] thng discussed above.
> 
> So, let's not add comments or commit message info that might point people to
> do the wrong thing.

It's correct *iff* you're using the in-trampoline remapping (the comment
is above dt_cg_tramp_remap_args). Obviously if we end up removing that
function, we'll remove the comment too :)

>> Can we guarantee that trampoline() is only ever invoked once, and that
>> it's invoked after probe_info is called? If it changes the remapping
>> array, any subsequent invocation will do the wrong thing. If it's
>> invoked before probe_info, it becomes impossible for probe_info to
>> adjust the xlated types appropriately.
>> 
>> This all seems like way too much coupling to me. At least done
>> this way trampoline() is idempotent and doesn't depend on being called
>> in the right (undocumented) order wrt probe_info.
>
> If the actual probe arguments (argN) are being reshuffled (which is what you
> are doing by shuffling the arguments in the trampoline), then the mapping
> needs to be updated to become an identity mapping i -> i).

Yes, the code does exactly that, in probe_info.

I don't know the relative ordering of the calls to probe_info() versus
trampoline(), but when probe_info() is called the mapping *must* be
fixed up, because it's probe_info()s caller that stashes it away -- so
it's safest to set up that revised mapping there. If I set it up in
trampoline(), I have no idea whether we'd reliably have the remapping
worked out by the time probe_info() is called or not. Yes, this means
there is an implied coupling between trampoline() calling
dt_cg_tramp_remap_args() and between probe_info() having to change the
mapping in the args -- but given that you've been suggesting similar
coupling between parts of *dt_pid* and dt_prov_uprobe, I was assuming
you'd find such a minor coupling (between, really, trampoline() and
probe_info() in dt_prov_uprobe) uncontroversial.

>                                                             Otherwise there
> could be other code at some point that tries to apply the argument mapping
> and that would be really bad.

Well, yes. Is there anything anywhere that documents the order in which
the dt_provimpl_t callbacks are called? They're invoked from all over
the place and their call order is distinctly obscure, and deciding
whether it's safe to play with DTrace-side arg mapping info from
trampoline() is core to that. (As opposed to merely *generating code*
that shuffles args. That can obviously be done at any time.)

>> (Or are you suggesting that dt_cg_tramp_map_args(), or its trampoline()
>> caller, shuffle the xargs too?! This seems even *further* from anything
>> a trampoline() function should do to me.)
>
> Why would xargs ever be shuffled?  There is nothing in DTrace that does that.

Good. I thought you were suggesting it, and was rather confused.

>> >> + * arguments are overwritten (but saved).
>> >
>> > Caller should save.
>> 
>> As far as I can see this is not implementable without massive disruptive
>> ugly (or at least pointlessly duplicative) changes, see above. It
>> doesn't seem to buy us anything, either.
>
> How so?  Just put the dt_cg_tramp_save_args() call in the trampoline right
> before you call dt_cg_tramp_map_args().  How is that a massive disruptive ugly
> change?

Here's the code again:

	/*
	 * Work from saved args so we don't need to worry about overwriting regs
	 * we're about to remap.
	 */
	dt_cg_tramp_save_args(pcb);

	for (i = 0; i < nmappings; i++) {
		if (mappings[i] != i) {
			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(mappings[i])));
			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
		}
	}

i.e. it's *using* the save area. It relies on the args being saved in
it. Either it does so itself, or it silently relies on callers doing it
(! ew), or you're asking me to *not use* the save area but instead
implement arg mapping in some other way (and this is what I thought you
were asking for, because having dt_cg_tramp_map_args() not save the args
but nonetheless rely on something else having saved them already is
horrible, surely you don't mean that).

At this point I have no idea if you want me to reimplement this in terms
of something else, add *another* saved arg area just for the sake of arg
mapping, implement some completely different sort of arg mapping
algorithm in raw BPF (no thank you), or what.

>> >> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(remappings[i])));
>> >> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>> >
>> > I would add:
>> > 			argmap[i] = i;
>> > to convert the mapping into a pure i -> i mapping, so no other code will apply
>> > argument mapping again.
>> 
>> I think not: see above.
>
> I think so, above also :)

See above: I have no idea if this is even slightly safe, because I don't
know the relative order in which trampoline and arg_info are called. I
at least know what I'm doing now works.

-- 
NULL && (void)
