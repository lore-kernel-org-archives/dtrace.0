Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8BA272803
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 21:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760046338; cv=fail; b=aezC4sXpd+SemiQO1DDDlNhgI35l023+VnraoNqhJPXLM0d31C/lt2vfGC9MM/fkIqlc0SKK3NPqZDVg3mXar6l8G8R7emNmr6NJL/xW0qy15C8aUY6fAw9mGx/YGCYuwRlhzjnk5zFJmG3LuBT+flHgnCjOoY1xkAHU4w/6Dt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760046338; c=relaxed/simple;
	bh=tJkzKXTugS/NT43VHAI2V6+o+KwzcXnDGMMx9ZQrgR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cgPTSphLRMfFo3DuaB01mTP04qOd7a1CZALsdjAOYAEMF1kx98Gj3HDh7Af4O8P1LMByVjNf9Jsw55OSgPeIGIYVMaHVF5DNu6jUksghZ0fu3DgBszNM6Gf/RijG2ao2RhVOB9dezhNlkjEnul0Kb8UBtt5PZEiZrYvYtMqsjgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J0uCXx8c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OnXri5qH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J0uCXx8c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OnXri5qH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599KgJ0Y012677
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GzF9FlUJsV4TbkEV2d
	ItyxqClxUCJ/wBODzW4zhO8U0=; b=J0uCXx8ch2hqO/vLekLjW1nTBZsWvJflUK
	RDmSl45KJ1mv2u2KXoUsesIDI9D/5d+sqP9NLHMVTnm4wPgkNG/OYvRUrvQi0nJk
	+E9e96viSSiTXYt9pxKsn6R0grN4AyAk4IldOBnP95uXDoO5EwyhDUKRCw8Cc5px
	Vbp/8XVna7A46+gMSLH+ZVuQclIXKfWDXHbdCJEyiiz6dUoBrzawN9p43K1xgVcJ
	fpMYJJbQ6AfOURQcQH3ZmCfueMnrkP0uzqwOqrlO303S27dsE1o0DL7IPjDFX/nz
	5D+UrkyVyMvOmoLJmXP8SHFs1pBtK9/aXqmKFkTgS3u0XNlg7gow==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv6dthph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:45:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599JmGA9036731
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:45:28 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv688192-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:45:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9+kfReasq1hd6G38xCUhyPwEcE2tHcDBIbEmGbyXTXyuJUQurhggpDI4WzfK4iTwMocrEZZCCClDNnXU/sI3IqCtR8mWW+lxe1zOahqxcB0P4V5atOHtB4W+dRc9VlzvCLplUCviRxbP7Jofjcyn99Svg7Bn6hFFjokBTrLoTzs/FmmcyxjI76/83DMrmXuEH+NG/u1aQvVXYtxOXqqxXNoHT4a1mnoLSa5583V0uYjWN7dNkyiPatfdc4WIS31USGUA9aYEoX/HAvBdJjis+o/l3LxbRCCWdO0EUG2itJEQgO2K9tl6TT2FfDzVURQkry4NNCA7df2wObSsf1FnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GzF9FlUJsV4TbkEV2dItyxqClxUCJ/wBODzW4zhO8U0=;
 b=lg9BtLjkk09W8ljE8+5O29VJZPXERhf3/mOMel1Wd11aNLaQ6x2408bgfIXI/wO1MDbulMxEy+YAtSbtmQYJyguOekBuLgKgMsfvGSf1P1RLZ1ksk9FHXiW1Ui2TjrecJYS+yJowcvPI7BJwEtBFqUHJkb1SNvUEEDB1Yzs+8Y5bSOnlSSNDJ4xJuQ34ty7LCzyaTHYKe2F59iQFvMu3SzbdBRBAmHFNSQBNZszDk4eipNCSeQTTsT8IyZBnuzz/iy3SkfLSOGTQ/2dP1FNWvD98Zekbp0buVmS2/T7Wxo5BDH22on/OJp1Vla9CNfM3DljVQAR8NXu467nJ5gR5uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GzF9FlUJsV4TbkEV2dItyxqClxUCJ/wBODzW4zhO8U0=;
 b=OnXri5qHqGBozEXFnHLG2EaumovXdelQUPIxjRKZZnlp9iQO9r5IDv2JxfqUvhHOxVEqyJSWeM6//pdl+KEiUo3XRSjTKN4miLHpcZonyWjIIdBRVEk/+mZm9JEXytNf1FY3g7hJ5qtHCm+fkamotoZwMY5fEpdXcN5mPELiBLk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8186.namprd10.prod.outlook.com (2603:10b6:208:511::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 21:45:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 21:45:25 +0000
Date: Thu, 9 Oct 2025 17:45:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 17/20] doc: Add IP provider documentation
Message-ID: <aOgs8dd4BPKg0ymC@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-17-eugene.loh@oracle.com>
 <aOfq59B41hE5uas/@oracle.com>
 <1c254ac3-ef20-b402-5e5b-debdf5128a8f@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c254ac3-ef20-b402-5e5b-debdf5128a8f@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 4808743e-459f-471b-1237-08de077d277a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?34drNG/hQgllkHzKu1SU51+MY/EFvGlThCk9R/AT/bWvAZLFnS5fjcyrvr77?=
 =?us-ascii?Q?EynM/dyJZ3t5DMLGCwWPdM7mUU+JBdF8NPyBdEwTxKLq43u7SakfdXjD4fho?=
 =?us-ascii?Q?wHvo01qHaTcB8k4/zokJlyXcYY+8GxVa38G7xuVl+5koo2NYGkCVsHBig0ph?=
 =?us-ascii?Q?cn7R7xg5QW468RnV8epsYeOmiMwRbvjeHVP7TLOMzFC/UL5MVnZTAsLOjrzs?=
 =?us-ascii?Q?kNn2O/cLUO1H5Ec3cMywekwWO805udkc/HarQB3+XVS3UEGX39TJg8f76I9e?=
 =?us-ascii?Q?O+e31wZ8eiKpDBmnCPDbY/yY3PDfN/BQGvvtTJ6hV7lIc2e4/hCWJEI5i0gW?=
 =?us-ascii?Q?qOSMTrWFjZIrrwn6wRUqypIANZq/yhXrqila9HCeMSvDkxvJnJU1+HkExCBZ?=
 =?us-ascii?Q?8jhRybS5ueEmHgMICGzwryp4yllZO5t/ves6IpKklztl5C4LmtzCONmj82ca?=
 =?us-ascii?Q?UalCuu5IKbJGTCIuhm97bEBbArnGzfCBAWmipL5Qk7uRL6ezxuW4Go5u6DjE?=
 =?us-ascii?Q?sTAqaDyljL8Ne2UiXn5jSnx451N4f4sqjmbbS6V7uBBby37SJbrp0jQ9k7of?=
 =?us-ascii?Q?PPUv5TCKo0BKG4Bq/nyf85f5zXNMVKSmOBtPZJT9jMJcnLntXeWszfvXwCjD?=
 =?us-ascii?Q?Iq8U9pIfHh8S4g2QIqC1p46FibLCRrV3aLkV/j5We8oIXpRpJwCm6urhgfsh?=
 =?us-ascii?Q?Cp13rm2+AVII6XlGrnXFLSQd6db6+xjA0o+v8L3rgjmLRpeRm2wL/uFJAslR?=
 =?us-ascii?Q?X0Y4t/FUk8Kt9USSw+wWQfsMx36+yHZWkgnjqAF/tudj/dPhK9edBc5IMM0E?=
 =?us-ascii?Q?6XyWxc93EzfDeSpaRcI6K8ljL1olTWVjQvExKumgqJTGB28YLDYjyylQYufV?=
 =?us-ascii?Q?luGNSIPRmfdSf1CeogLTDMW1BBc80ljznSXfgzYs3ALucSdMu4jdx9zGu4x4?=
 =?us-ascii?Q?RF4oP7uOuoCXZMnt7DgZl86ELXPqeMnG/hHwwVZWkHYpT2hw8n+6hxD85yrf?=
 =?us-ascii?Q?z3tuBEu8klitSShLUaWxorr75TDfY0a/8Ea6FVAuzKiJYamd+6/zYhMIe9JO?=
 =?us-ascii?Q?vkG20Fm1nt9AfDFqHntW1w6A9soejil4cgiHHi7ko6lypD7nLwpWNV2nP22p?=
 =?us-ascii?Q?35WTChdVH7x8/0AVFFu+pWIJN4hsypsbw9v4HnsvqgoCdiiKRmTFXtZ71dBG?=
 =?us-ascii?Q?Gtxek+W6xkBDTCAV0JdAZ3MGgDqKgt93ikzZthUl22W2J6MQMp5cJS/06tDA?=
 =?us-ascii?Q?5Ng24SPFF4FfmaJFIFAQ9ZBzH8cWFVEvt2JhALH8f0mjND0TWQYIYLy4rJKv?=
 =?us-ascii?Q?F5jHAsK5HDZ1DwbWRtzVgc97Ny0/TgtPM+DVma3T01yCgZ4v3hMJn1A/TbL0?=
 =?us-ascii?Q?lrcmc162C1KEOkqg0N63xuAAAZIV4yhb8sQmcHzT/bDW1sllWSpD902MMjSj?=
 =?us-ascii?Q?GCVuYpDvplkRUsBT6bhzemnDvM9sUAmZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQZ+FBxxXVgux7wkbwGR0ILxDEO6THQUZM75L3I7ZAu6kg0+ktnvD9BjKT2h?=
 =?us-ascii?Q?PTz/e8CcRb5+9NCKLaCHdyDGkN7NeZ5kyyoQhytN5bcXLH10dB6gXBObtkyg?=
 =?us-ascii?Q?8vmoo0V3qRH/Zd7e3bODAllqA9EMR4Zlpqh+TuI1uatJ0UbpSb+N6aObaDmZ?=
 =?us-ascii?Q?aIEenQFOwGusNAqvs2+h/fEbP6CwFj67QvkWxoF5hclKW7iBDON9q5F+/P/b?=
 =?us-ascii?Q?HYji+HZL7860EZG9heVdEy30MrqIe1idi9ZnGyaAvIQ3lwQlgEmuHUGjNvrs?=
 =?us-ascii?Q?C+/d6eACLEf7p4vqcwOWUii8iuaVkHvghL7DO4DyQqIZvv6BFLWIkOhRu0n9?=
 =?us-ascii?Q?tR+9N5HZh/30SLcZ/F8PLGknlSN7+kgJvdZfzfl+zETh1E3+7gUNX9rXuRD6?=
 =?us-ascii?Q?O4BXgbF7NgnNSFFzC9GkG+hUEgobvFnZnph8P3GvULgs5HQBfKQrsCf/FnGx?=
 =?us-ascii?Q?3VRp1Fgsyx4ReR5ukVX8ZCFjKj00ofIR+7UTtV8UtIbRZ9dEtgoTGFGDPY2C?=
 =?us-ascii?Q?qznEBGbjeBwFKmUfwWegxrfnjdDUHnwRvXH/inDmf72dvkn3iQ8+YvocvdFX?=
 =?us-ascii?Q?IonyEa80rw/0o1wdtq1KP5sVrtdSfQO/9Ure1U+jpTPHXdvbOtwxDBzlCgEQ?=
 =?us-ascii?Q?P/Ezi+t/ve4NwKFlwIoCYTOCsJ+bsaH74VsJ5LegcCpsHR9Wb+tZkKjmRqMY?=
 =?us-ascii?Q?QORaVC6NgRMJXPqfZ9lBlJZcz6Kq7Z1XR9XYKduP30Qb87b+FVf2Va6+AOH1?=
 =?us-ascii?Q?wzxmXKd0F2keNJSA4exDjif9zYSlLnD1AXHayGo9GBQpXWm4k/1DjqJQCLmM?=
 =?us-ascii?Q?dBToaeH4aAxpGx1/BdgLMQMB9xRli8BxLVXHReNcKAfK6LzOM63Yni+o5w9Q?=
 =?us-ascii?Q?cdjszY43rLd7JI5iI2NkQjoQy3MpLvMto4Asay+o6zQDjam0KuT6Fg51sj92?=
 =?us-ascii?Q?bH6nAeqfPAhPM1C9Fvl3JNg8fFBGH5p6Z9yjvlVyAt2ASEOLvap6Pfj7rKLT?=
 =?us-ascii?Q?UM+SvBeV2lhxzFzXwTsIUG3S1vSmcjdUBVLNdtH4HNDB9DjD9YjDAX4BQSzE?=
 =?us-ascii?Q?yx2uImN+UlGiTtURRcX+FMoe3UFtCx2OnqH2UHEn+rcL9pxsFGFbikjcjD1L?=
 =?us-ascii?Q?z/vwk826lYYdsmLZYuRs6bQOP4c1NPcxwUiaHdnDf/lMfJKgRAigbaDH+O8n?=
 =?us-ascii?Q?JP4quGUedks22Vq3Zb3l+w4l/pw4GCLK14B+UCBsDpmNM10l+xmh6OJdQ0Ai?=
 =?us-ascii?Q?OBe3PHJWAMxK4KrbC9DoIlmy9EwOCACx+0L0sxU9+SkZkU5fQyEHqZrM8+SE?=
 =?us-ascii?Q?YO+SEXrPbgX7DVflvoOff8sxWJXLLycTYL0gANGeik7+8wq+tRuYnYmfsKKH?=
 =?us-ascii?Q?2waISjOU58xijEHnlIpmQ6yn8M6NnROcr7pp9/MkWWCd61CqoKG5Cbk6rGYC?=
 =?us-ascii?Q?8+WctX6wn8HcHZFwwuSSnTYxA5WCVwJUaM/dzlmSk4t1y2jyzHB1mPTBylRa?=
 =?us-ascii?Q?tXBQAbMgcf8AR4cxU+5megJZDhmYLL663+ELJF+evP+clfOlbK7KuuphrsSt?=
 =?us-ascii?Q?GNe/H0miNbAi16k6DW1nusTjRmJiE2t2zBu/DT8ZqiJOZGM50bDAl/beUfrx?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Qnm1nnin1Y8+aga815chJVRAAkoz2EHBXwWg73jty9N6jK53Qug7PXdFu12nt9t/YYsxWT3R4Fq/RzpYciXGdE2o92JrnmavnOZt80pIeriF4Eh8emcbZqOfay2yFcKk8fe7zx28kX3WV3YdRxQMfXODHX2jnNqvpTh9rDwMaUD4pvuh46naGUEowUvr/j7uKLEsQh9TK0jJd8eS5tjYqN/tXtz0kQGhkG7GHGQVGXvXbOzUXXi0fgeqtx31erfm5y8piiW+OvyfbS0NM6sY2+QpAZQzOY2lbkrQjML6MAoh/ABwCGW9C8ctbNLfoKTtk64/BreDitGCwae2RCdvhR9UQoYS/ASV07S+rsDDLwL32W9BrfPy7auBFQwiZNw/CzDheM9EilDVlBAYIMoudDtIwI3wKq+TRFhNmyPWzWVuU2ZbZ3UmcAHWUG8pNa3Fi/1vjUK8eEUXGepslcs9DTYV1A55bX2gTJQpwG7kKBaAhSzAZa+OZZcv7TYTQuDXuEp2g8I+EXMJ0bnQGza3o5s4X8QKyxDcCJpBIl09TQQjDZj5qBNAiYE6TNeJup/xL9ekFzM5rNY5f5LyCbL3jp11a6+1Wef/gG11pWMwm1s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4808743e-459f-471b-1237-08de077d277a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:45:24.9327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JwLwoNEzk3x8PkgfpgTK5NKv0MdOj3GRBPqSXRuLga8sxrVyccDsHC5QCGVdxf6nCdP++ha6cZaTVoZDUqRomdA2/5prFM4cMKZ3OiJf0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8186
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090132
X-Proofpoint-ORIG-GUID: gvMwCLE_NpmWeRaE5eo33EOj-L6OTBhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX03HofJCSjMa1
 eGmxbs8xkxCKO+0/bSqEj+4g+hvvRWPNFucbWQCjwXKa2HXpDn1Xee39xUhAwkdMNx91P5vP8qd
 3DlOUZOqaNURaHV8y8+tRGS/qW0x/w+5yiqoAaqmViLGl5X7XopkCKTERvK3EwEXeddpEply1YJ
 h+/T0t9c80KsYevy1PR5aAVO10ZJKD8PYljp93N9xUTbPIRgAoH1+3NUVBRjDZ7dRrWBgBJOzkg
 9F81LDNF4/yNok+o80ONd1w4VVUy+uLVj/nJuPlqIVTPmYpG5pIUwFXjzzppmi1fSVqp9cdq+UR
 C0USK/Jx7StZYpbdM2HTtj+U/RzKXnqv09tJVZEHPnVkW+OoUc2gk6iByph/m0099mFFSe37VI5
 V2xPem/CaugmbVugeLM+yn9FSoDVPw==
X-Authority-Analysis: v=2.4 cv=etHSD4pX c=1 sm=1 tr=0 ts=68e82cf9 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YuxWIpyDjRA4yW30S3YA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: gvMwCLE_NpmWeRaE5eo33EOj-L6OTBhO

On Thu, Oct 09, 2025 at 05:00:06PM -0400, Eugene Loh wrote:
> Hmm, just to clarify... you mean pull this patch out of the patch series so
> that it can be applied independently of the other fixes?

Ah yes, I didn't realize it was part of the 20-patch series.  I think it was
an independent patch in its v1 form?  If so, I prpbably was thinking about
that.

OK - let's keep it as part of the series and it will go in with it.

> On 10/9/25 13:03, Kris Van Hees wrote:
> > This patch does not apply cleanly to dev-queue.  Can you look into that and
> > post a v3 (keeping the R-b)?
> > 
> > On Fri, Sep 26, 2025 at 03:05:54PM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > > ---
> > >   doc/userguide/index.md                        |  10 +
> > >   doc/userguide/reference/dtrace_providers.md   |   2 +
> > >   .../reference/dtrace_providers_ip.md          | 174 ++++++++++++++++++
> > >   3 files changed, 186 insertions(+)
> > >   create mode 100644 doc/userguide/reference/dtrace_providers_ip.md
> > > 
> > > diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> > > index f3d96a4d6..18b9bcd68 100644
> > > --- a/doc/userguide/index.md
> > > +++ b/doc/userguide/index.md
> > > @@ -208,6 +208,16 @@
> > >               -   [fileinfo\_t](reference/dtrace_providers_io.md#fileinfo_t)
> > >           -   [io Examples](reference/dtrace_providers_io.md#io-examples)
> > >           -   [io Stability](reference/dtrace_providers_io.md#io-stability)
> > > +    -   [IP Provider](reference/dtrace_providers_ip.md)
> > > +        -   [ip Probes](reference/dtrace_providers_ip.md#ip-probes)
> > > +        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#ip-probe-arguments)
> > > +            -   [pktinfo\_t](reference/dtrace_providers_ip.md#pktinfo_t)
> > > +            -   [csinfo\_t](reference/dtrace_providers_ip.md#csinfo_t)
> > > +            -   [ipinfo\_t](reference/dtrace_providers_ip.md#ipinfo_t)
> > > +            -   [ifinfo\_t](reference/dtrace_providers_ip.md#ifinfo_t)
> > > +            -   [ipv4info\_t](reference/dtrace_providers_ip.md#ipv4info_t)
> > > +            -   [ipv6info\_t](reference/dtrace_providers_ip.md#ipv6info_t)
> > > +        -   [ip Stability](reference/dtrace_providers_ip.md#ip-stability)
> > >       -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
> > >           -   [lockstat Probes](reference/dtrace_providers_lockstat.md#lockstat-probes)
> > >           -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#lockstat-probe-arguments)
> > > diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
> > > index 9f64935c6..54a018d5c 100644
> > > --- a/doc/userguide/reference/dtrace_providers.md
> > > +++ b/doc/userguide/reference/dtrace_providers.md
> > > @@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
> > >   The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
> > >   -   **[IO Provider](../reference/dtrace_providers_io.md)**
> > >   The `io` provider makes available probes that relate to data input and output.
> > > +-   **[IP Provider](../reference/dtrace_providers_ip.md)**
> > > +The `ip` provider provides probes that can be used to study IP traffic.
> > >   -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
> > >   The `lockstat` provider provides probes that can be used to study lock usage and contention.
> > >   -   **[Pid Provider](../reference/dtrace_providers_pid.md)**
> > > diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
> > > new file mode 100644
> > > index 000000000..4e6c47fb2
> > > --- /dev/null
> > > +++ b/doc/userguide/reference/dtrace_providers_ip.md
> > > @@ -0,0 +1,174 @@
> > > +
> > > +# IP Provider
> > > +
> > > +The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
> > > +
> > > +**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
> > > +
> > > +## ip Probes
> > > +
> > > +The `ip` provider provides one probe for IP sends and another for IP receives.
> > > +The module name is always `vmlinux` and the function name is empty.
> > > +
> > > +## ip Probe Arguments
> > > +
> > > +The following table lists the argument types for both the `send` and `receive` probes.
> > > +
> > > +| arg       | type            |
> > > +| :---      | :---            |
> > > +| `args[0]` | `pktinfo_t *`   |
> > > +| `args[1]` | `csinfo_t *`    |
> > > +| `args[2]` | `ipinfo_t *`    |
> > > +| `args[3]` | `ifinfo_t *`    |
> > > +| `args[4]` | `ipv4info_t *`  |
> > > +| `args[5]` | `ipv6sinfo_t *` |
> > > +
> > > +### pktinfo\_t
> > > +
> > > +The `pktinfo_t` structure is an abstraction that describes a packet.
> > > +Detailed information about this data structure can be found in
> > > +`/usr/lib64/dtrace/*version*/ip.d` or
> > > +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> > > +The definition of `pktinfo_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct pktinfo {
> > > +        uintptr_t pkt_addr;
> > > +} pktinfo_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
> > > +
> > > +### csinfo\_t
> > > +
> > > +The `csinfo_t` structure is an abstraction that describes connection state.
> > > +Detailed information about this data structure can be found in
> > > +`/usr/lib64/dtrace/*version*/ip.d` or
> > > +`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
> > > +The definition of `csinfo_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct csinfo {
> > > +	uintptr_t	cs_addr;
> > > +	uint64_t	cs_cid;
> > > +} csinfo_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `csinfo_t` from the `struct sock *`.
> > > +
> > > +### ipinfo\_t
> > > +
> > > +The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
> > > +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> > > +The definition of `ipinfo_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct ipinfo {
> > > +        uint8_t ip_ver;         /* IP version (4, 6) */
> > > +        uint32_t ip_plength;    /* payload length */
> > > +        string ip_saddr;        /* source address */
> > > +        string ip_daddr;        /* destination address */
> > > +} ipinfo_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `ipinfo_t` from, variously,
> > > +`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
> > > +
> > > +### ifinfo\_t
> > > +
> > > +The `ifinfo_t` structure contains network interface info.
> > > +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> > > +The definition of `ifinfo_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct ifinfo {
> > > +        string if_name;            /* interface name */
> > > +        int8_t if_local;           /* is delivered locally */
> > > +        netstackid_t if_ipstack;   /* netns pointer on Linux */
> > > +        uintptr_t if_addr;         /* pointer to raw struct net_device */
> > > +} ifinfo_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
> > > +
> > > +### ipv4info\_t
> > > +
> > > +The `ipv4info_t` structure is translated version of the IPv4 header
> > > +(with raw pointer).
> > > +These values are NULL if the packet is not IPv4.
> > > +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> > > +The definition of `ipv4info_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct ipv4info {
> > > +        uint8_t ipv4_ver;               /* IP version (4) */
> > > +        uint8_t ipv4_ihl;               /* header length, bytes */
> > > +        uint8_t ipv4_tos;               /* type of service field */
> > > +        uint16_t ipv4_length;           /* length (header + payload) */
> > > +        uint16_t ipv4_ident;            /* identification */
> > > +        uint8_t ipv4_flags;             /* IP flags */
> > > +        uint16_t ipv4_offset;           /* fragment offset */
> > > +        uint8_t ipv4_ttl;               /* time to live */
> > > +        uint8_t ipv4_protocol;          /* next level protocol */
> > > +        string ipv4_protostr;           /* next level protocol, as string */
> > > +        uint16_t ipv4_checksum;         /* header checksum */
> > > +        ipaddr_t ipv4_src;              /* source address */
> > > +        ipaddr_t ipv4_dst;              /* destination address */
> > > +        string ipv4_saddr;              /* source address, string */
> > > +        string ipv4_daddr;              /* destination address, string */
> > > +        struct iphdr *ipv4_hdr;         /* pointer to raw header */
> > > +} ipv4info_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
> > > +
> > > +### ipv6info\_t
> > > +
> > > +The `ipv6info_t` structure is translated version of the IPv6 header
> > > +(with raw pointer).
> > > +These values are NULL if the packet is not IPv6.
> > > +Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
> > > +The definition of `ipv6info_t` is as follows:
> > > +
> > > +```nocopybutton
> > > +typedef struct ipv6info {
> > > +        uint8_t ipv6_ver;               /* IP version (6) */
> > > +        uint8_t ipv6_tclass;            /* traffic class */
> > > +        uint32_t ipv6_flow;             /* flow label */
> > > +        uint16_t ipv6_plen;             /* payload length */
> > > +        uint8_t ipv6_nexthdr;           /* next header protocol */
> > > +        string ipv6_nextstr;            /* next header protocol, as string */
> > > +        uint8_t ipv6_hlim;              /* hop limit */
> > > +        in6_addr_t *ipv6_src;           /* source address */
> > > +        in6_addr_t *ipv6_dst;           /* destination address */
> > > +        string ipv6_saddr;              /* source address, string */
> > > +        string ipv6_daddr;              /* destination address, string */
> > > +        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
> > > +} ipv6info_t;
> > > +```
> > > +
> > > +**Note:**
> > > +
> > > +DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
> > > +
> > > +## ip Stability
> > > +
> > > +The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
> > > +
> > > +| Element   | Name Stability | Data Stability | Dependency Class |
> > > +| :---      | :---           | :---           | :---             |
> > > +| Provider  | Evolving       | Evolving       | ISA              |
> > > +| Module    | Private        | Private        | Unknown          |
> > > +| Function  | Private        | Private        | Unknown          |
> > > +| Name      | Evolving       | Evolving       | ISA              |
> > > +| Arguments | Evolving       | Evolving       | ISA              |
> > > -- 
> > > 2.47.3
> > > 
