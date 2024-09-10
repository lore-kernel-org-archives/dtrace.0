Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A38171671
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725949219; cv=fail; b=h2it7KZjx0Xbjr1Gu8ak+QwpjhC070tSsDyIS4sIiYhV9JgkIbItqYLLziFd6E/xXC43G3c1t5cVzs2wgQ2xEUUlJ1BwkpObF8xlZi+BSHv3wcGQGMOIWGM9i3MEay3V2dGgztB0PpfJbNAD0+ki8ryWGkGzMwCR0LJrY4IwqvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725949219; c=relaxed/simple;
	bh=IioSWNaX9gEIzZSJy/Pn090dSmQU90oGRwZ9XG92l64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s4wnv0f3iafkipp8q88Gi8ZNC2xTw2TSIxAfbjpaVST1nhRA8oyqkRDF0lUUq3YnKvoBOvj/pY2zCvLp6ZFwFVZT+2U6o80z7i25UacRTQAs/qbP7kJcSDDNXR+dKENXz6stkYMN03y37NoczlIc4D5sTYvTnfh/+THyO47x/Mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=brUd4VhK; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BPg81KRa reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="brUd4VhK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BPg81KRa"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A5xZSA025035
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 06:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=U08CHuJfvJqSpXAeKYqmwq6O4+U1oZe2p7QazzXHktA=; b=
	brUd4VhKQ9kbfI7hFbuEl4bZ7c7z6Tq5CRZE6huj3bF8G3sXPBJiR4P88bSLKNbk
	Wg8YZlxhP9lFYztQmGb4lj0tvQ6j4BcQiRYzc+fDl8l16XhHU1wikHVE/csdPYar
	WnrWHkP4K55CgFUBkQCi92sj/KZCDfE7mI+W+u0IAv/dPtJ4bSPW4axBNq6v85nJ
	LbwfydVQHN6ZvuPIQ6klF3kaYGEjZpCW36yLumE9R9/M+0MUMljy3+rfO04V9z8w
	QCbyUeYtF0wCk0MVV5VxlVwKZxwmApDewNiVNw0TdZKC/yNwzqqzRLOwgii8AV7c
	8+OViQNfUFo+dv2ZP9zvKA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjbumgg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 06:20:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48A5WUKj040827
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 06:20:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd99hdy1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 06:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtoHgR29Q7VuYJjkZ6rCpL9eo5jP7Y7BNMB88RUSlsxcoogxXnl5pI0SyxWHT2hLnvljLC5PhuxDexMKEBPdViJbvjIMI2A8Xks4gLYZbj8dIdH9oqGX7YkYYzP4uvKmbS55ldo+js7dQsC/V9MWZiePtsVC6MqzxqCnCL4v+NCefqDHk0bk97QNdVBJTFhNgB0s02Z3aTeVb+gKdDwSO86Wy14PdMXqHAXCoY6T/y8oczwWtEoch2GvW+xR9iqiCs0tiTqk5GkCImXjMgByCHkv86BbR67YPO4fVTQY6pSzGGEmjTgoZg2CHoGHjcXiYgoy4ySVltTQkRuc2RLD2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwWiqNdm8ActZa4OHO89ITiS6W5oPjEOKR0EIwVq/JE=;
 b=KfbJt3bSPjIueKE7zHssE31xXJaJPw4Sn9xb5RabIibff0leqDse+iNlbWz4k0YVMNwcTii+5Y9ETvYq9DA17MLQFNFYp3DK8s/zUqVdPB5QvHv+mFTgtx9CzDvitG0Kapk6cXN8uBWkBP3tywpsY7PGOellunhrezu9GpkMTqY6D9UI3AiefHfs0TOve48J38iW2BCo7vXhwDQCTu/JjxFgVN5jq+VvZwQnEx7NN1sdQ0RDIF5ORMhuZBKs90b00avN1l2wfSBhKSZvcRDenc/5ROeB9G1FIKU5rYnYBAdjY5NsmJs0n3IgVTWMrhjn2qiOwsZSUj/1OeDD/w2QOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwWiqNdm8ActZa4OHO89ITiS6W5oPjEOKR0EIwVq/JE=;
 b=BPg81KRaCI5jOGhSxP7tG3pxz+Fg+/AId6bpDNirf2aREwdJQGcrhQtwwmg36eCggJDdDDVVGeUYU3Wy0qjn7BuVunmrO9PEnfEY5o/vzNOTSUxQuxGKe6wV4qUtx9sLa5m3bGEwbTOaM477eBhIcIqOmp/MpXekU6Zr+fq+ssM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7852.namprd10.prod.outlook.com (2603:10b6:510:2fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.13; Tue, 10 Sep
 2024 06:20:07 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Tue, 10 Sep 2024
 06:20:07 +0000
Date: Tue, 10 Sep 2024 02:20:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Message-ID: <Zt/lE5Ye0q+wOE8K@oracle.com>
References: <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <65f82c4f-e826-2f66-2ff5-b38bea4de817@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65f82c4f-e826-2f66-2ff5-b38bea4de817@oracle.com>
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 8443ccdd-48b0-4e84-0a48-08dcd1609d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?MsxLEfPMmu+cBBc0CMbLWijgA5nXqbErCk8J3leJoAa8or9gBOcekcxNPp?=
 =?iso-8859-1?Q?w618RttkbN3Sb5IhFU0tTIrZrq+CDFd1ZICsg4oOcoUw3xOrpZvQ1Ljc+s?=
 =?iso-8859-1?Q?1Pl7jCwBiK3J7TVfOYHc28WKlY3dJZJArtjAscWKUcOd9e47yhwoFA/3Hb?=
 =?iso-8859-1?Q?H3Ogqk6M+wJgiYa9tyJfSbwGmQ4xrDmhkucKc3BzKiO9COfd2xTnCFbiBn?=
 =?iso-8859-1?Q?2ZBmwStzfzVPM2mY+hnur7lZrCX8MhW/16ItTaae0er1Weu0A+YjxYR0HG?=
 =?iso-8859-1?Q?kOlSoAQdEK2jGoWtbxTh2tFLSo1my4nrCOjiLlOrekKWr0Ps6KMUn4KqxZ?=
 =?iso-8859-1?Q?/hqwuEv1R3eIbYXhnNgetFjMfbrQLM/aJ4VTbEQQkYbZ+F87mc0oknncJ4?=
 =?iso-8859-1?Q?LqINrXf6s3M3IsGmHH9UbduevBL9lS0qH6l1TdJSgo0912pUqM99i5qawg?=
 =?iso-8859-1?Q?QNXhqT7Ko50dBqtxDoFhk0K6N1PO/t05TCRne0PXNHu1YM/rrcD4iVXZtD?=
 =?iso-8859-1?Q?Obpp0nQDVjh/BzzzCtjSNatoi9eImnC/GVIJMba++D6KMIg9gcTorvHTpK?=
 =?iso-8859-1?Q?ojmEfQKmGN/7BjEAcFDD/42D7FLeib+9ktRZiNavE3pbH+Al4espiNXDRV?=
 =?iso-8859-1?Q?IDBGfUYuCj1l1xnfEJVdEvooSoOyZGjx/oy+441xEAK3kqiOFsKOaNklJs?=
 =?iso-8859-1?Q?8RdWhQZeaA+Q7s31kakUJY4tiEuhaW3mWjQr5Rm9Jm/4jCAOajm/j/9eN7?=
 =?iso-8859-1?Q?mBBP2SCT/a94a05uAR/eGNGLA+Ok62X3uShwblmQxcaciSQCAWqe/wlOj3?=
 =?iso-8859-1?Q?tki90gFp9D3PiXaBZ2DR6Qrx8uI78r0wAf7H9PSzWmCePBPx+/f17Q8MYm?=
 =?iso-8859-1?Q?hSm0OzsI6R6Tn7AgzKmjNNIhGdh1kG7gLX+o7vFTN+eLQf+xxQuGSEdnTP?=
 =?iso-8859-1?Q?IHwQMSVh1zstnAacxwZ9M4Hk0zV3ojKJZv4TieCUCQm8eeSWsnG3sLvEJV?=
 =?iso-8859-1?Q?gtjQQvzJTIuJd1NiSt7pbQLtCiGfmF+3IT9D3idYv776k9xmmcGsVRq2DH?=
 =?iso-8859-1?Q?Wyfed3PPpQqnTt6sx84k+uN/43NTUxz4rwy2qYySShOE6JTDDTMYz/BXGZ?=
 =?iso-8859-1?Q?E+g6a3QKrlEHwINzAx8Z+PhrQmUwW+P0fhDY3iD+VS1g7pAbYwHNz/tw7t?=
 =?iso-8859-1?Q?jqlaSBRCmNQ/LsaZzUVm7h4ukbJLQ/ZevAFncXlGZ0GufCXiT9Ipd15mK3?=
 =?iso-8859-1?Q?MB18hJvpb6BjwJ3gZ1aiGjORXEWaOVaZy+Av1rbwMitcgrk6+FYLtuoaCS?=
 =?iso-8859-1?Q?WNf5fAk7qsvRA1AI9C2L+6qVHuHm6N4PVO0c3l3JjPtiSoQW9tKzugvh3p?=
 =?iso-8859-1?Q?Kl5nP6k2Ci3/VagVI/SiUsXCrhcpKlNExBnRKjpVCyJHOGsTDX17Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?cM92RC7JxBwuyzN0h2Vz7gH2l361PLXWXL4RBHpNWJBZn/KHqO4+cOVwpv?=
 =?iso-8859-1?Q?sKk9aB/c1sF61mP6QG/61wILe98aLINIbHofn0CAsWSsCibxI7/S0Al2kl?=
 =?iso-8859-1?Q?8YfmEdmptA1CtfO8TKa6Efd5a3ZMMDvpKou7ZnhQt/nluc88/D8wf4lbdJ?=
 =?iso-8859-1?Q?2EluLBmWswxnhRHkPPGEnawQ4M5b3ypNRN+/srgBx5FMLiXI6yXARib/gn?=
 =?iso-8859-1?Q?A6mQ2jvuU1pYErwC+VsPbZec0t3+U22WsR0eDDb7nwTP/VdAcpIO+minDg?=
 =?iso-8859-1?Q?uv64ZLh95QjGIrjs+g9EhAA1GqqqpGO6M1wI28Spf7APVnfeigSlRfj2AM?=
 =?iso-8859-1?Q?COItRe2+3F2nmpspbBngDCdV1azWyAvkyvT33FEaeJiG1i0OAMYLuXuGV0?=
 =?iso-8859-1?Q?P85kz/iryUmPFLHzXkZJzgnSbqZDnGIs+mgNObyB3S81FgG2x54jP0a1Jl?=
 =?iso-8859-1?Q?fPpttPx/nD8wbf2/7vGIzJFtbxV6wNwOLQYONa9PbHAFfeDdPdjk8brg/v?=
 =?iso-8859-1?Q?F9TEtw8kgFPD0V9UKhn3Ld/OW2dkjhmV7XhXbdUKJMxwJj7M8W883d0FuX?=
 =?iso-8859-1?Q?rHCEBExbVkysI4H3HFH+xyXi3CE14GFlBtY2S7n9C/LJkDn1xr6sTo4iQf?=
 =?iso-8859-1?Q?o1aCtY2Mluz/DrobwllayyZbh1puN198kvSvin2E9i/CBVgfzFwlGXEYF0?=
 =?iso-8859-1?Q?u+AoHGeSb5AR5kGSqh5IfnWbshfOYRgTdljQa5XZvia6Hdc2oTCZ+09Xry?=
 =?iso-8859-1?Q?cDJ0Qk+PxGh1BHVaiVLOY0ta0p2XK+ArIDLjMVGzvSzVFfkhnnbo+GhTXa?=
 =?iso-8859-1?Q?YQZ7WuoLY7vEnHrriDQd1+Yncdh8xWxpnyiZpPMsUAKYQE/aP15OvqQY5b?=
 =?iso-8859-1?Q?kaJv5IZnRfNloxdbgQfGI8WMJSUqaiCsDlxs6H85kKxaQ65KOwdTAyd6hF?=
 =?iso-8859-1?Q?GE0RqXR0nuveefYEX8h8gphbhFVu8/4YsGS7yS9V0HUGF2K2rgW3trdwdn?=
 =?iso-8859-1?Q?kYoacQu7nr35atwSWRbS1JiPpjQx5CLirYg/eMuVWOR+PZebVr1LD5zOeg?=
 =?iso-8859-1?Q?FAdYMy+Z9+sr+ej7tAIvde7xzmIbcLDR7nZKpbJpw4fCgY2PCKieujaGyA?=
 =?iso-8859-1?Q?A/U8LvRpPtWeaBbazWxDbZuSIGoIMgqOF2xyfHOwQhqC1IlU3a7jO4Xt+o?=
 =?iso-8859-1?Q?gHQFISG6tDEukEHQ6UgSjQbKajFCdsM/OHo8VHt5gpJDSoFhytp1tx2H6B?=
 =?iso-8859-1?Q?DUNRN6638XQFknsAFzWocxuH/zTLkL3SIVpNl4SeVHK57I+hvTZJ+bx75p?=
 =?iso-8859-1?Q?YIe2BD7WXBRTAu3JgrgmVG5u5CATpr1BKGiY5EFG6N2FouwdzxzEeH48YY?=
 =?iso-8859-1?Q?0XbedwEd+6FmFfYiW+ImvtN/q6aU3McPPJxASHFt1xuno5Eeza2QhJ2Xzm?=
 =?iso-8859-1?Q?BO5hgA0uzr2V5Q3/xQ6JMRBOGC4uGamrgTZCMv52RgLM7i5wJacxC/rwy8?=
 =?iso-8859-1?Q?12d+zlkyraLLoLn/zV7eX9QuUzT1JsHk0JE4TP95qiM2CPz1mRlAZ1OftT?=
 =?iso-8859-1?Q?KrlG5c0iPMjvXm6XAVDjjPJAxfUwYDbttGt9fslCimkKJ/RTvPd3ph/oVD?=
 =?iso-8859-1?Q?GMcBaa7yPZcTi1SRELTsC4O3Z9dPAKyWzcVMcHZJujlmnihP3J6BEuog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vqRLO4H2XZG35FWDjZ8sW3LYMGm4HQxqTmk/TEqbOLPe8DFjnHQeTuK0CXY3aikTUJFl/BmwbUiN+4VN8Wf/mqP1ITCok5NV4rKRrBtHyp/Y1zZ0WBswKZLZsX5iPEYk9fnEJJMGe0iIwEDQg/mvThiFydwxe6D989NacA1l696/kAM/ENitZJZUauT3q5/2gNup9tHirGC+rXFqNIYBlsJ0T/VotkxmIUP5h7XDZTaoWGLxy0LQkjrYr1X2j5z6i7O/Xo8HObV18bl64/U8wZd2A16lzYBo3PqQnObgze7DWtdVQktSzMUcD/yficc8JRrYjwN73mile/SnO6cKGit0+VLeU/teOc+bfFVFMVpSsNfFxx/kxTqylfE0V6AQ/miTD/WzeKsJdykh2Fm9KwDgWgTG/vXDgQtMhhzZF+HhvaBRFbykUwuNONvDLIkOq9v2DVnA/6NYMHlQfVqMrWdtoFuflT6NsylOEsJhRCJd1LXkHLkW/RpIRCN55Kke5cRI7FExFX2kVCmP+71c0NfWCtXIDpsKgk/4n441MZUcaSdMIpoIDr2b4owVdoZzG616aQMADVJVobX5uowSlB01QnKpRgTyKXw6qmJ298c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8443ccdd-48b0-4e84-0a48-08dcd1609d76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 06:20:07.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5/RW+tf8E+s6cszyCjAp86nM/svdjjNrIjeJy7DPpZ7Rz/X0OZoPloOGwPv5iw5hAoluFPqkMjioPBhrx4pX9v/EigRnTQXHpRHDlfHa9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100046
X-Proofpoint-GUID: RbO53v9HW65S3vTacGKrRYkS9pCE0H0E
X-Proofpoint-ORIG-GUID: RbO53v9HW65S3vTacGKrRYkS9pCE0H0E

On Tue, Sep 10, 2024 at 01:51:41AM -0400, Eugene Loh wrote:
> On 9/10/24 00:33, Kris Van Hees wrote:
> 
> > When an ERROR probe fires due to a fault happening while processing a
> > probe firing, it was corrupting the first 6 probe arguments of the
> > probe causing the fault because they were being overwritten.  But since
> > a fault only aborts the execution of the clause it occurs in, those
> > original probe arguments might still be needed for other clauses that
> > are executed for the original probe.
> 
> "due to a fault... probe firing" makes the text cumbersome;  readers already
> know why an ERROR probe fires.
> 
> How about replacing the paragraph with, "When an ERROR probe fires, it
> overwrites the first 6 probe arguments.  If other clauses are then executed
> for the original probe, the probe arguments will have been corrupted."

Thanks.

> > Save arg0 through arg5 prior to calling the ERROR probe, and restore
> > them after the ERROR probe finishes.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   bpf/probe_error.c                             |  3 ++
> >   libdtrace/dt_dctx.h                           |  1 +
> >   .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
> >   3 files changed, 52 insertions(+)
> >   create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d
> > 
> > diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> > index c8ddcdfa..8d631704 100644
> > --- a/bpf/probe_error.c
> > +++ b/bpf/probe_error.c
> > @@ -26,7 +26,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> >   			     uint64_t illval)
> >   {
> >   	dt_mstate_t	*mst = dctx->mst;
> > +	uint64_t	argv[6];
> 
> There is a compiler warning that argv[] is not used.  Did you mean to use
> argv[] instead of msg->error_argv?

Ah, oops, meant to remove argv[] here.  Will do that.

> > +	__builtin_memcpy(mst->error_argv, mst->argv, sizeof(mst->error_argv));
> >   	mst->argv[0] = 0;
> >   	mst->argv[1] = mst->epid;
> >   	mst->argv[2] = mst->clid;
> > @@ -36,5 +38,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
> >   	dt_error(dctx);
> > +	__builtin_memcpy(mst->argv, mst->error_argv, sizeof(mst->error_argv));
> >   	mst->fault = fault;
> >   }
> > diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> > index 1422ad24..9f33f1fb 100644
> > --- a/libdtrace/dt_dctx.h
> > +++ b/libdtrace/dt_dctx.h
> > @@ -31,6 +31,7 @@ typedef struct dt_mstate {
> >   	dt_pt_regs	regs;		/* CPU registers */
> >   	uint64_t	argv[10];	/* Probe arguments */
> >   	uint64_t	saved_argv[10];	/* Saved probe arguments */
> > +	uint64_t	error_argv[6];	/* ERROR probe saved arguments */
> 
> I don't think such a thing is needed in mstate.  It suffices to use local
> storage in dt_probe_error(), which is probably what you really meant to do. 
> Plus, calling it error_argv[] is misleading since these are the args that
> you are *NOT* using for the ERROR probe.

No, because that makes the stack too large and then the BPF verifier rejects
the program.  I hope to rewrite the ERROR probe support in the future to use
a different mechanism, but that needs more design.

> >   } dt_mstate_t;
> >   #define DMST_EPID		offsetof(dt_mstate_t, epid)
> > diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
> > new file mode 100644
> > index 00000000..6fd1834e
> > --- /dev/null
> > +++ b/test/unittest/error/tst.argv-corruption-by-error.d
> > @@ -0,0 +1,48 @@
> > +/*
> > + * Oracle Linux DTrace.
> > + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> > + * Licensed under the Universal Permissive License v 1.0 as shown at
> > + * http://oss.oracle.com/licenses/upl.
> > + */
> > +
> > +/*
> > + * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
> > + *            the current clause, while other clauses for the same probe should
> 
> "While" is a confusing word since it could mean "during" (which was the
> sense I assumed when I read this).  How about s/while/but/ or something.

Sure.

> > + *            still be executed.  This tests that the ERROR probe invocation
> > + *            does not corrupt the arguments of the original probe.
> > + *
> > + * SECTION: dtrace Provider
> > + */
> > +
> > +#pragma D option quiet
> > +
> > +syscall::write*:entry
> 
> This ought to work, but strictly speaking I suppose there should be a
> trigger.  In fact, it might be nice to use a trigger whose arguments are
> known.  How about a test that looks like test/unittest/pid/tst.args1.d? 
> This could also illustrate (without the fix) that only arg0-arg5 are
> afflicted.

In this case, dtrace serves as the trigger itself and given the arguments to
the write syscall, the ERROR probe arguments cannot be mistaken for those of
the write* syscalls.  So, this is certainly sufficient.  And since we compare
the arguments of the first clause with those of the third, we can clearly
detect validly whether the arguments for corrupted or not.

> > +{
> > +	self->arg0 = arg0;
> > +	self->arg1 = arg1;
> > +	self->arg2 = arg2;
> > +	self->arg3 = arg3;
> > +	self->arg4 = arg4;
> > +	self->arg5 = arg5;
> > +
> > +	printf("%d / %d / %d / %d / %d / %d\n",
> > +	       arg0, arg1, arg2, arg3, arg4, arg5);
> > +}
> > +
> > +syscall::write*:entry
> > +{
> > +	trace(*(int *)0);
> > +}
> > +
> > +syscall::write*:entry,
> > +ERROR {
> > +	printf("%d / %d / %d / %d / %d / %d\n",
> > +	       arg0, arg1, arg2, arg3, arg4, arg5);
> > +}
> 
> Maybe it'd be nice to have the printf()s also emit labels so that if someone
> needs to look at the output it's clearer what they're seeing.

Not really - the sequence is pretty clear from the script.

> > +
> > +syscall::write*:entry
> > +{
> > +	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> > +	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> > +		? 1 : 0);
> > +}
