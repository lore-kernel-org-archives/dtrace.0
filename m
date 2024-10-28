Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E672B188CAE
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730132198; cv=fail; b=s1OLTWRZxNy9AKUpAJxSKE/4q+fLjZo4BNQqE23C1MPBsR+GXhIZ0y5oWuRtEiIcCb9sIkHnFfILZsiXVOSR54gm3IC67b7aqAMV/u28AoifNDThlea6zqm92bE6IBeU+zUcVhNN1HU/iUE+zJSYNalackG6ApgD86yeQY2vFl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730132198; c=relaxed/simple;
	bh=27RitFs6umB6oeIXFMqfaru5E+2lSSTYrFieYf9W6nE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=pP6i0qa7MlpYrdHccNjnreafBthep46brfXIQ2Xj/Ex8/rKjAYxTu4TQpJCc4PLhlyfjq+UUVUvMREsr8/Gd25gdkvGuAu6ld216a+sfDeghlXw+hGbQ+S916fLgSz2pI5IARXZa6vW9keepIU6uzusYKxw4k6XPVmucCwXO9Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lJTR0j9l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZVdwbn76; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lJTR0j9l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZVdwbn76"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEtf8o014160;
	Mon, 28 Oct 2024 16:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Y5zSd/PcMYanN8mZJZ
	aboU1gRUQA3I0Y0zkkR57/9bo=; b=lJTR0j9lkyKgJpkfw4UQ1NzelAJitvyaAh
	wTJFl9nj17boBZfg7Jwmbdw8WMtn16ng2Kuq897RO65U0VGMLxExvUkbyB9GK5Tf
	Vzm5la4ZVMzngFHauk3Q2v7X9G8vbwbp41QSvAFefJpxcjU4zTz6AiP0NLLAA+1l
	tlba264zqbXcYSTfOTs4aYhWvZJiiP02CfkNhCrN4BmbBGPIcq/fU8lPi3Dp8wd9
	OAG9RvEMHBs0I+uiZHWg0kyXUfXNZMvf/nzD3yj1MUGyB+Wk19bLmZF3NI7RxrLM
	TO5ZeeqAfw0P/9v7LvQJhO6iAaZUv5pKvf/A0ZtJqNaTRJc/jHrA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwb9df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:16:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SFi80C004866;
	Mon, 28 Oct 2024 16:16:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2ss61s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 16:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3KwDfhmr02nGO8FlE1f6PB7ZTLwP5CsJyXPTUWBJE3WMdip1Hrm3iXRWYKomhV3ypg3/JkJZAqXotU7MKiwIp92gsoI1C5kj1ECkg3tZwtnkcmswSZwk6EL48NXcN5fPzN0rdg50mmVfTzof/VC8ISkFEcLZxHbwTnDNJo8fo0B8t8Mu6qVhiuvfL6H3H4s9X2fe/EAQgtP3hhnAAzwMDHaoSskBTF2zrjLNXwBhyy2/09Jfv8Kt93rTkomR59RrEZ2wPx1trwowj0tjd+eIshzAINXcLTRYxEZ9AT7K29COAaiBa1cMjA1QbjgcnHbJ5aANCkwbrO8VFU5sdThqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5zSd/PcMYanN8mZJZaboU1gRUQA3I0Y0zkkR57/9bo=;
 b=u6SkAtYuCfhRZ20tCQUg08620mQF3gDCrRMrwbfUdljPHS5w1zeJstkaZ1wovBV4llqui9rk2l9VJSLGyISTVeoglV49J5c3sGcEDpK69/BszHFeoYoaxqGemcTMkK2sHEIF65l3a/r+cCniIliq39EcOeo9I/aehk3O2YL6wDGSNjTQPyGjzgFjO0IWQIfjWG1z9MheM2uLesE/izenR5CZw71ClMAUHhW2Fyr5qyZoCbuyJoyLvARC6mk0BtFzUqyCguYWDy1WSIBavuGj5KxjZ1TH5uv0kTK0/e7W073G6+ZFA7EHLH6eZxxFgENQ6CIgBRFVM6v0QoJUiPry5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5zSd/PcMYanN8mZJZaboU1gRUQA3I0Y0zkkR57/9bo=;
 b=ZVdwbn76L90CGYjRLezInEtW+nwuj4yBVeLrAY1HNu+ZBTLQRR38UjIW0oGoQ8yER5xHYLPvcShau8SmJNcl2sP++q8jc30Y5rBgBKWklbQqBq806bHEVh0PKs2J5OxY4Sgt1/AdwP/YEds3qt3L6NCCZgL8f6OpAGy+tlNt0NM=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 16:16:31 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 16:16:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 02/14] pkgconfig: drop spaces in variable decls
References: <20241024113758.182050-1-nick.alcock@oracle.com>
	<20241024113758.182050-3-nick.alcock@oracle.com>
	<ZxsA9ee8F2-cJ4yY@kvh-deb-bpf.us.oracle.com>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Mon, 28 Oct 2024 16:16:28 +0000
In-Reply-To: <ZxsA9ee8F2-cJ4yY@kvh-deb-bpf.us.oracle.com> (Kris Van Hees's
	message of "Thu, 24 Oct 2024 22:22:45 -0400")
Message-ID: <87y128qk2r.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::17) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 4829d01b-551d-424c-eccc-08dcf76be254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ngi5ZMBrnerTbBUVVfdOIgvWRvW5TFHHALOJTCDr7L0/Ka+wagjNmL6RkBgO?=
 =?us-ascii?Q?494BiP4OWq6tZQPiII1MwUmSVhdtWKQHCGQyWdC/FrgUy7hVZdG32vVBugFz?=
 =?us-ascii?Q?uNS0MCyNwnXD1xTQ0IUhlpNtZFU0gMCzDRfucTmcLUVg5cytG+hvImLsoiwY?=
 =?us-ascii?Q?3a49ZRZHMcTwt/jRgSkcntE/Ezd0taSE/KQ0iPYp9EZppMmliG8P2+hcy/2T?=
 =?us-ascii?Q?7bxxMhyyO7eJxkS4Il1Cs8O0o61BlBpBE0px9sCAuU0BZP3bv95ZPJTGX4ok?=
 =?us-ascii?Q?YopftoRkUgg3Pb47jfKMwk6yCFK83eL5BMfoZaekrxUD+OpgJHmtgbFv4KiO?=
 =?us-ascii?Q?i3EsYwFlnfUA5aZOM/A66vTKJ4D8K81W61vaejeWkSPVA0aCbW1U+k6v9nKj?=
 =?us-ascii?Q?tBDe9OTZPCM0jX8RaVhj64S29ZPgQrMJRPfQAvVLwwOIFVsM6GVGnhLjbeUK?=
 =?us-ascii?Q?DoEF1yrUXja5v0O9cQP94AoVE/xvhvZbJA5Jt3Hmzam96Mfsu9dnjrrRGAsb?=
 =?us-ascii?Q?oXU3hgbROVbkBHP8vK/RZ1J5045MIGFIjC/BbRZ2/r+WacqoOiS5MGxNPksQ?=
 =?us-ascii?Q?uPaJLL7tunWfYRrFH3WWu8lwDLGCkHOedyLg+A+73Q5pkC5bry43Hte6wgck?=
 =?us-ascii?Q?gHZxnCQ2giWZzX5azi2akwVyCazy2QxPwXWtOrFMuL1p/l7CM8QXHE5dUy6H?=
 =?us-ascii?Q?CpS59nMbcCcVeFkwZ3x+jA4Oy4jKkIludCk2s4pG60VfEmq8h9KilNJVqkYD?=
 =?us-ascii?Q?EEaaRNUj7YivVlO5U1KK+4H4tCnokPI6AlYqe18vZFCo5q5yP1lFDrA/5JIe?=
 =?us-ascii?Q?hAQ7lyWyuRWxEFEfdn6/QFIbArfUhVD6jkLs3mGILbGy5e3QbKfYi1ZL+K+v?=
 =?us-ascii?Q?mt7fXmDpVLxkXFmSFtn56ymWPUwQkuJj8mu7YOQRxQhID+psIDifgI5Nh7BA?=
 =?us-ascii?Q?Q475/jaEv2EnJ4qz7nDK2OYbRQmaaSxIyi3io0/hURGoQNL4uhSuowvhDCga?=
 =?us-ascii?Q?5YtVu/d98IQ5jLeoOH8mkwJ1b8DtXqPN6nzSW8pv7fFrhLweZd1tZJsg6vHS?=
 =?us-ascii?Q?877roLxAj561YspLsZy8Kxq/kjDpxBV2aNuF2p7wwYVI9o3AshPPWTk+YKEo?=
 =?us-ascii?Q?cCqlWaF1vbTDDwiJlEJ4ZZ3c/QpQhNg0OS/HgjhcyZhW3tuJjq1SAgH8eJxC?=
 =?us-ascii?Q?GmJRomd1jb0DB8PYzPUKQMwfemLKvROnR3Zjz+HfOrZvwc/eUGFMos3objjF?=
 =?us-ascii?Q?+Gfo1G2eTDYlQXZVGZzh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uv04M6kcAlPS0HsiftDRwry/Nv/YoOO9tVl1Uu3F7khDJ6IF+01o8ovrcxYi?=
 =?us-ascii?Q?VsmgQjAPJ0l9E+dWigOrKCweWI/xwge9VG5DVqNZ7kDnk2GMY21YcTVrS98P?=
 =?us-ascii?Q?mmeHvZ//bsHlVAtoqMUXggIPWj+zQie0SJx9+a9g0ZnF4zLKogVcWfzmnSaJ?=
 =?us-ascii?Q?w0/hHBVHJt+lxfFgNq8x7xSHjh9lmSl/tDka2vcqQLmNPl5XQX1VmLN9RVoT?=
 =?us-ascii?Q?C2q/0VmUAQVqUJgOhtH+86PRXSd6ZanuPQHeLxUsDGnwbV9BrBRqHcBceYUc?=
 =?us-ascii?Q?EylEDcuqrK8UDNHDqf9oADogI2OCumd6isjRE24T1E7LBADXU3Qp6GqYBF6G?=
 =?us-ascii?Q?qhxs/dGJ8/2AYXmcpsPl67M+8C2kB5OkFI7GflRaMiIX4UYRQ2w5S2Qq6FDg?=
 =?us-ascii?Q?LZFLQ5t4E91Um2z7liI+eyoQDGpEAH+0eG8eyGZLTq64dz+PY5y3/di2Ycg1?=
 =?us-ascii?Q?r9DCSgsDmtRtWkC9ipWgTsKSR1cQctiWBaTN3YbmRSQcHPq1zmq2nB0HwhYW?=
 =?us-ascii?Q?OnEc9w+UA0XWggeWWbR8Wlv8oRwBu2BBmeBvwW0bPRooHzO0KU0IEdh+hrvU?=
 =?us-ascii?Q?jHgH/cTuh2Yu/+4rC5X88DG1EaFnDMDWB8JtA1EKh45GkZ/4RyXqGGu3yXQk?=
 =?us-ascii?Q?/63fFv4uZWs3aHZObP1BFHjHmQ+0oyux+ia8lLxoGyYRB3keWFhE0MS0dFRL?=
 =?us-ascii?Q?ghjORsVxaeZMema3aqu2yPZfFF2fdCiRWiCaSs/2kjKsQDGkvD3JT7r5CFN7?=
 =?us-ascii?Q?Z9dxsR0hrwgfuOUe6oq62vudy46eK+A7snnC04t5EHYNbktBk4T7OhI5VjPH?=
 =?us-ascii?Q?PKeFsIgtDr6r/rSakHPzVKlq0cJhyCxVR4V6kgE9EUeCLskhn9DnMYjAIGLx?=
 =?us-ascii?Q?/jiafSmBWe3cgrwrLDxj1GePALqGUnUDMboAHGhYKPE8gE7y6C5xuZmh2V59?=
 =?us-ascii?Q?p39p5b/bxZ1OmRoqgyAPWQq7BFHTVGV1otwgyvuZPjTcUyy3KaPh+DCPdT42?=
 =?us-ascii?Q?lNaJ228yjPEQKOheI59iFRDICdvjOYylp5X+mvzZwh5stD1R9UnmpWg+Vh95?=
 =?us-ascii?Q?nuaVJ9t7F7ma4v8AfBx4t4ZdYuev2zCuTDx8ZQZQcFC3msqNNj4MABByIRGl?=
 =?us-ascii?Q?EsBnsLFTUIGcTX3WrW6hS1/T/klSys0Qk84H/L7ajtthzt0GI9qeF6MnRcfd?=
 =?us-ascii?Q?IWpNOhChhWokQyPraN/cOFIw/HNEntzu4OG4CyDAlb28gBDWuViqWnkp5DUF?=
 =?us-ascii?Q?aibEpOG+Y3RTPLKHD2lWSWI1ctddQwVQkeTyLuQ+bX3Ga/SU4KF7ywloa2pV?=
 =?us-ascii?Q?zyzAd0NcCYxmVWtlUxZs0Ru1JZnt6UwK2ICLYaWxQfJ/39ymIaxIIL3ETQxb?=
 =?us-ascii?Q?eE8br7wLyHUYLUIipISQMCbXPs70z85IB+HuUAFaGuY9s/dgTiSG3WhYBsH5?=
 =?us-ascii?Q?UtDll9rTDLboBmp2KAaAAoWfjVFmf7whz8y/dWlqU2sSZcDqlhTItM+VTW0t?=
 =?us-ascii?Q?v0O+tJs9/lBRqgYpWmWjeRnxM9EIUotVkGbNDVu90+0vc5YymwzPpNkotWyn?=
 =?us-ascii?Q?BjAsn2kp6g7OiYT48jyn4QNyvFD91j1v1Rd1aXJprmjLMQ8teBVa/UBSA410?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j7p0moeMdcA/3yjqRcK18iKw+bOxmmy6XCA5XBfmy4kc9xiiScgomNiz1QVwQb9B+xiWmB/PBHp4HmjP4YsNvlZGYDOrE8SKZg7qWmll6jpDXynDVuGE4E6+WVIg9vc/2wQkj3dYNkHsB/kCjw6hg2pfML+LebIP4/ccCPE+nRDR+P4VOFFWBKWV2pPeDSOOI/wFVCrciQBxPp0YG/TTM66sArpIdyoZ89wgWf8g/PndysEZvP1CgH1URfVibcpZhYwpv0AT6e4pB2/5JM0dPIPI98HrPy89Z1af330Vrj9m0p0PqulKTKC3sOoTLU1nAyMtYtrsPtiYvG5ETQJatvSYOdUSrvQRAvRk4IK0XSU2UvPWJb1rGB1J0y3dh6E7oE+2qoEPAzXljpLt7OMSBvvWwWTTGmZJBQp3W1j8/i3SnZNE5PBnJmPEf6NJWI10N/NcEP3u5N05QuMa/vn6AB4NrPnnanGn9rUzF1HJBUNtuDBGyW0DhxVZA0ykLb+XCDBA0uC5opHik9HBtxyvnj1JxF5t3ePQn8NkPlAMKyFBSK1Fkgqzqut++yV4BRrZ9VUOfZgDUAAXCePGS0K8sW1RblQyTz/byEan54T+3cE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4829d01b-551d-424c-eccc-08dcf76be254
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 16:16:31.1462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcwMEVZqSPjFJ7fRvsVgnG1mzwlrIfP4er+BMp74gz+N3XqVCGuNvC83BQzQn6ICvQJoexypGkWhaFcLx7esXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_05,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280129
X-Proofpoint-ORIG-GUID: d5OgFldWeqimiWf5R9qYUGCd5lIABskp
X-Proofpoint-GUID: d5OgFldWeqimiWf5R9qYUGCd5lIABskp

On 25 Oct 2024, Kris Van Hees said:

> On Thu, Oct 24, 2024 at 12:37:46PM +0100, Nick Alcock wrote:
>> The requirement to have variable declarations with no spaces in them is not
>> documented, nor does pkg-config seem to care, but most pkg-config scripts in
>> the wild conform to it and pkgconf --validate complains.
>> 
>> (pkgconf --validate may also complain about the Version lines. This is a bug
>> in pkgconf, <https://todo.sr.ht/~kaniini/pkgconf/15>, and should be
>> ignored.)
>> 
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> Bug: https://github.com/oracle/dtrace-utils/issues/105
>
> Move Bug before Signed-off-by, for clarity and consistency?

I kept on oscillating on that. I'll shuffle them all.

> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Thanks!
